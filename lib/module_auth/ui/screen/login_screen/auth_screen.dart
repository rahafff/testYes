import 'dart:async';

import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'package:yessoft/module_auth/ui/states/auth_states/auth_state.dart';
import 'package:yessoft/module_auth/ui/states/auth_states/auth_state_register.dart';

@provide
class AuthScreen extends StatefulWidget {
  final AuthStateManager _stateManager;

  AuthScreen(this._stateManager);

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
    _currentStates = AuthStateRegister(widget._stateManager);
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
