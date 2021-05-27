import 'dart:developer';

import 'package:yessoft/module_auth/enums/user_type.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:yessoft/module_home/manager/home/home.manager.dart';
import 'package:yessoft/module_home/ui/screen/home_ui.dart';
import 'package:yessoft/module_theme/service/theme_service/theme_service.dart';

import 'auth_state.dart';


class AuthStateSuccess extends AuthState{
  AuthStateSuccess(AuthStateManager stateManager) : super(stateManager);

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yes" , style: TextStyle(color: Colors.white),),centerTitle: false,backgroundColor: AppThemeDataService.PrimaryDarker,),
      body: HomeScreen(stateManager),
    );
  }
}
