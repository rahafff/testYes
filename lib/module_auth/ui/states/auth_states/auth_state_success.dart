import 'package:yessoft/module_auth/enums/user_type.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
import 'package:flutter/material.dart';

import 'auth_state.dart';

class AuthStateSuccess extends AuthState {
//  final UserRole role;
  AuthStateSuccess(AuthStateManager screen) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo.png'),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          padding: EdgeInsets.all(16),
          onPressed: () {
            // TODO: Navigate to Home Screen
          },
          child: Text('Welcome to Yes Soft'),
        )
      ],
    );
  }
}
