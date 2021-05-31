import 'dart:async';

import 'package:yessoft/module_auth/service/auth_service/auth_service.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'package:yessoft/module_auth/ui/states/auth_states/auth_state.dart';
import 'package:yessoft/module_auth/ui/states/auth_states/auth_state_init.dart';
import 'package:yessoft/module_auth/ui/states/auth_states/auth_state_register.dart';
import 'package:yessoft/module_auth/ui/states/auth_states/auth_state_success.dart';

@provide
class AuthScreen extends StatefulWidget {
  final AuthStateManager _stateManager;
  final AuthService _authService;


  AuthScreen(this._stateManager, this._authService);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
//  UserRole currentUserRole;

  AuthState _currentStates;

  StreamSubscription _stateSubscription;
  bool deepLinkChecked = false;

  void refresh() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if(widget._authService.isLoggedIn) {
      _currentStates = AuthStateSuccess(widget._stateManager ,widget._authService);
    } else {
      _currentStates = AuthStateInit(widget._stateManager ,widget._authService);
    }

    _stateSubscription = widget._stateManager.stateStream.listen((event) {
      print('Got Event!');
      if (mounted) {
        setState(() {
          _currentStates = event;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _currentStates.getUI(context),
      ),
    );
  }

  @override
  void dispose() {
    _stateSubscription.cancel();
    super.dispose();
  }
}
