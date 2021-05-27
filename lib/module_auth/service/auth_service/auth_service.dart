import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:yessoft/module_auth/enums/auth_source.dart';
import 'package:yessoft/module_auth/enums/auth_status.dart';
import 'package:yessoft/module_auth/enums/user_type.dart';
import 'package:yessoft/module_auth/exceptions/auth_exception.dart';
import 'package:yessoft/module_auth/manager/auth_manager/auth_manager.dart';
import 'package:yessoft/module_auth/model/app_user.dart';
import 'package:yessoft/module_auth/preferences/auth_pereferences.dart';
import 'package:yessoft/module_auth/request/login_request/login_request.dart';
import 'package:yessoft/module_auth/request/register_request/register_request.dart';
import 'package:yessoft/module_auth/response/login_response/login_response.dart';
import 'package:yessoft/module_home/response/home_response/home_response.dart';
import 'package:yessoft/utils/logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/subjects.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:uuid/uuid.dart';

@provide
class AuthService {
  final AuthManager _authManager;
  final AuthPreferences _prefsHelper;
  final PublishSubject<AuthStatus> _authSubject = PublishSubject<AuthStatus>();

  final _auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  String _verificationCode;

  AuthService(this._authManager, this._prefsHelper);

  // Delegates
  bool get isLoggedIn => _auth.currentUser != null;

  String get userID => _auth.currentUser.uid;

//  Future<UserRole> get userRole => _prefsHelper.getUserRole();

  Stream<AuthStatus> get authListener => _authSubject.stream;

  /// This is a generator for Yes Soft API Token
  /// If this function is invoked without registering first,
  /// it will throw a LoginException
  ///
  /// @throws LoginException when password is not generated in Firebase
  /// @throws UnauthorizedException when password in Firebase Doesn't match API Password
  Future<void> loginWithUsernameAndPassword(String username , String password) async {

    // Change This
    LoginResponse loginResult = await _authManager.login(LoginRequest(
      username: username,
      password: password,
    ));

    if (loginResult == null) {
      _authSubject.addError('Error getting the authorization from the API');
      await logout();
      throw UnauthorizedException(
          'Error getting the authorization from the API');
    }

    else {
      await _prefsHelper.setToken(loginResult.token);
      _authSubject.add(AuthStatus.AUTHORIZED);
    }
  }



  /// This helps create new accounts with email and password
  /// 1. Create a Firebase User
  /// 2. Create an API User
  void registerWithEmailAndPassword(
      String email, String password, String username) {
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      signInWithEmailAndPassword(email, password , username);
    }).catchError((err) async {
      if (err is FirebaseAuthException) {
        FirebaseAuthException x = err;
        Logger().info('AuthService', 'Got Authorization Error: ${x.message}');
        await  Fluttertoast.showToast(msg: x.message);
      }
    });
  }



  /// login to Firebase Authentication with an Email and Password
  /// If success, Continue to login to the API
  Future<void> signInWithEmailAndPassword(
      String email,
      String password,
      String username
      ) async {
    try {
      var creds = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _registerApiNewUser(AppUser(creds.user ,password, username));
    } catch (e) {
      if (e is FirebaseAuthException) {
        FirebaseAuthException x = e;
        Logger().info('AuthService', 'Got Authorization Error: ${x.message}');
        await  Fluttertoast.showToast(msg: x.message);
      } else {
        await  Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  Future<void> _registerApiNewUser(AppUser user) async {
    String password;
    bool successfully =   await _authManager.register(RegisterRequest(
        userID: user.credential.uid,
        password: user.password,
        userName: user.username,
        email: user.credential.email
      // This should change from the API side
    ));
    if(successfully){
     await loginWithUsernameAndPassword(user.credential.uid , user.password);
//      _authSubject.add(AuthStatus.NOT_LOGGED_IN);
    }
    else {
      await  Fluttertoast.showToast(msg: "can't create account");
    }

//      password = Uuid().v1();


      // Save the profile password in his account
//      await store
//          .collection('users')
//          .doc(user.credential.uid)
//          .set({'password': password});


//    await _loginApiUser(user.userRole, user.authSource);
  }

  Future<AllUser> getAllProfile() async {
    return await _authManager.AllUserProfile();
  }

//  /// This confirms Phone Number
//  /// @return void
//  void confirmWithCode(String code, UserRole role) {
//    AuthCredential authCredential = PhoneAuthProvider.credential(
//      verificationId: _verificationCode,
//      smsCode: code,
//    );
//
//    _auth.signInWithCredential(authCredential).then((credential) {
//      _registerApiNewUser(AppUser(credential.user));
//    }).catchError((err) {
//      if (err is FirebaseAuthException) {
//        FirebaseAuthException x = err;
//        throw UnauthorizedException(x.message);
//      } else {
//        logout().then((_) {
//          throw UnauthorizedException('Error Registering with Auth Provider');
//        });
//      }
//    });
//  }

  /// @return cached token
  /// @throw UnauthorizedException
  /// @throw TokenExpiredException
  Future<String> getToken() async {
    var token = await this._prefsHelper.getToken();
    if (token == null) {
      throw UnauthorizedException('Token was not generated');
    }

    return token;
  }

//  /// refresh API token, this is done using Firebase Token Refresh
//  /// @throws
//  Future<String> refreshToken() async {
//    String uid = _auth.currentUser.uid;
////    String password = await _getUserPassword();
//
//    LoginResponse loginResponse = await _authManager.login(LoginRequest(
//      username: uid,
//      password: password,
//    ));
//    await _prefsHelper.setToken(loginResponse.token);
//    return loginResponse.token;
//  }

  /// Log users out
  Future<void> logout() async {
    await _auth.signOut();
    await _prefsHelper.deleteToken();
  }


  /// Get User Password from FirebaseFirestore
  /// @throws LoginException when no password is found
  Future<String> _getUserPassword() async {
    var existingProfile = await store
        .collection('users')
        .doc(_auth.currentUser.uid)
        .get()
        .catchError((e) {
      throw LoginException('Error Logging in, can\'t find access token');
    });
    if (existingProfile.data() == null) {
      _authSubject.addError('Error logging in, firebase account not found');
      throw LoginException('Error Logging in, can\'t find access token');
    }

    String password = existingProfile.data()['password'];
    if (password == null) {
      throw LoginException('Error Logging in, can\'t generate access token');
    }
    if (password.isEmpty) {
      throw LoginException('Error Logging in, can\'t generate access token');
    }

    return password;
  }
}
