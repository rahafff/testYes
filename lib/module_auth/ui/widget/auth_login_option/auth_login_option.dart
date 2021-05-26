import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yessoft/module_auth/ui/widget/email_password_login/email_password_login.dart';

class LoginForm extends StatefulWidget {
  final Function(String email, String password) requestEmailAndPasswordSignIn;

  LoginForm({
    this.requestEmailAndPasswordSignIn,
  });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
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
                    widget.requestEmailAndPasswordSignIn(email, password);
                  },
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
