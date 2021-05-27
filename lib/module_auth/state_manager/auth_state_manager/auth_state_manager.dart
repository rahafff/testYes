import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yessoft/module_auth/ui/states/auth_states/auth_state_register.dart';
import 'package:yessoft/module_home/response/home_response/home_response.dart';

import '../../ui/states/auth_states/auth_state.dart';
import '../../ui/states/auth_states/auth_state_init.dart';
import '../../ui/states/auth_states/auth_state_error.dart';
import '../../ui/states/auth_states/auth_state_success.dart';
import '../../ui/states/auth_states/auth_state_code_sent.dart';
import '../../enums/auth_status.dart';
import '../../enums/user_type.dart';
import '../../service/auth_service/auth_service.dart';

@provide
class AuthStateManager {
  // Inject
  final AuthService _authService;

  /// A state transporter, I'm thinking of moving this to a super class
  final PublishSubject<AuthState> _stateSubject = PublishSubject();

  Stream<AuthState> get stateStream => _stateSubject.stream;

  /// Start listening to auth events
  AuthStateManager(this._authService) {
    _authService.authListener.listen((event) {
      switch (event) {
//        case AuthStatus.NOT_LOGGED_IN:
//        // TODO: Handle this case.
//          _stateSubject.add(AuthStateInit(this));
//          break;
//        case AuthStatus.UNVERIFIED:
//        // TODO: Handle this case.
//          _stateSubject.add(AuthStateError(this, 'Unverified Account'));
//          break;
        case AuthStatus.AUTHORIZED:
        // TODO: Handle this case.
          _stateSubject.add(AuthStateSuccess(this));
          break;
        case AuthStatus.REGISTER:
        // TODO: Handle this case.
          _stateSubject.add(AuthStateRegister(this));
          break;
      }
    }).onError((error) {
      print('got Error');
      _stateSubject.add(AuthStateError(this, error));
    });
  }


  void loginWithUsernameAndPassword(
       String username , String password) {
    _authService.loginWithUsernameAndPassword(username , password);
  }

  void registerWithEmailAndPassword(){
    _stateSubject.add(AuthStateRegister(this));
}
  void signUpWithEmailAndPassword(String email , String password , String username){
    _authService.registerWithEmailAndPassword(email, password, username);
  }
  Future<AllUser>  getProfiles() async{
   return await _authService.getAllProfile();
  }
//  void registerWithEmailAndPasswordd(
//    String email,
//    String password,
//    String name,
//    UserRole role,
//  ) {
//    _authService.registerWithEmailAndPassword(email, password, name);
//  }

//  void retryPhone() {
//    _stateSubject.add(AuthStateInit(this));
//  }

//  void confirmSmsCode(String code, UserRole role) {
//    _authService.confirmWithCode(code, role);
//  }
}
