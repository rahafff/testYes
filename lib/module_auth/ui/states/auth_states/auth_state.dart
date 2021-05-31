import 'package:flutter/material.dart';
import 'package:yessoft/module_auth/service/auth_service/auth_service.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';

abstract class AuthState {
  final AuthStateManager stateManager;
  final AuthService authService;
  AuthState(this.stateManager, this.authService);

  Widget getUI(BuildContext context);
}
