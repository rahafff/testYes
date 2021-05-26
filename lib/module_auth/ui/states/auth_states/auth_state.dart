import 'package:flutter/material.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';

abstract class AuthState {
  final AuthStateManager stateManager;
  AuthState(this.stateManager);

  Widget getUI(BuildContext context);
}
