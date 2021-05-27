import 'package:flutter/material.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';

import '../../../../module_auth/ui/states/auth_states/auth_state.dart';
import '../../../../module_auth/ui/widget/email_password_login/email_password_login.dart';

class AuthStateInit extends AuthState {
  AuthStateInit(AuthStateManager stateManager) : super(stateManager);

//  @override
//  Widget getUI(BuildContext context) {
//    return Column(
//      children: [
//
//        LoginForm(
//          requestEmailAndPasswordSignIn: (email, password) {
//            stateManager.signInWithEmailAndPassword(email, password,);
//          },
//        ),
////        FlatButton(child: Text("signup"),onPressed: (){
////          stateManager.registerWithEmailAndPassword();
////        },)
//      ],
//    );
//  }


  @override
  Widget getUI(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    EmailPasswordForm(
                      onLoginRequest: (username, password) {
                        stateManager.loginWithUsernameAndPassword(username, password,);                      },
                    ),
                            FlatButton(child: Text("signup"),onPressed: (){
                      stateManager.registerWithEmailAndPassword();
                       },)
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
