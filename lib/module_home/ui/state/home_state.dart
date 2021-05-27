import 'package:flutter/material.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
import 'package:yessoft/module_home/state_manager_home/home_state_manager/home_state_manager.dart';


abstract class HomeState {
  final HomeStateManager stateManager;
  HomeState(this.stateManager);

  Widget getUI(BuildContext context);
}