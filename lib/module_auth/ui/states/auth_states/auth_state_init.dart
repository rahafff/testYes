import 'package:flutter/material.dart';
import 'package:yessoft/module_auth/enums/auth_source.dart';
import 'package:yessoft/module_auth/enums/user_type.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
import 'package:yessoft/module_auth/ui/widget/auth_login_option/auth_login_option.dart';
import 'package:yessoft/module_auth/ui/widget/auth_options_form/auth_options_form.dart';

import '../../../../module_auth/ui/states/auth_states/auth_state.dart';
import '../../../../module_auth/ui/widget/email_password_login/email_password_login.dart';
import '../../../../module_auth/ui/widget/phone_login/phone_login.dart';

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
                      onLoginRequest: (email, password) {
                        stateManager.signInWithEmailAndPassword(email, password,);                      },
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
