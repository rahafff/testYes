import 'package:flutter/material.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
import 'package:yessoft/module_auth/ui/states/auth_states/auth_state.dart';
import 'package:yessoft/module_auth/ui/widget/email_password_register/email_password_register.dart';
class AuthStateRegister extends AuthState {
  AuthStateRegister(AuthStateManager stateManager) : super(stateManager);

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      body:Center(
        child: EmailPasswordRegisterForm(
        onRegisterRequest: (email ,pass ,username){
          stateManager.signUpWithEmailAndPassword(email, pass, username);
        },
      ))
    );
  }
}