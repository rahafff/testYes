import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
import 'package:yessoft/module_auth/ui/states/auth_states/auth_state.dart';

class AuthStateRegister extends AuthState {
  AuthStateRegister(AuthStateManager stateManager) : super(stateManager);

  @override
  Widget getUI(BuildContext context) {
    return AlertDialog(
        title: Center(child: Text('signup')),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'Email',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.supervised_user_circle_rounded),
                  labelText: 'username',
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DialogButton(
                  onPressed: () => Navigator.pop(context),
                  color: Color(0xff01A0C7),
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}