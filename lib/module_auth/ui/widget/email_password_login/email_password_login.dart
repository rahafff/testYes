import 'package:google_fonts/google_fonts.dart';
import 'package:yessoft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:yessoft/module_theme/service/theme_service/theme_service.dart';

import '../../../authorization_routes.dart';

class EmailPasswordForm extends StatefulWidget {
  final Function(String, String) onLoginRequest;
  final String email;
  final String password;

  EmailPasswordForm({
    this.onLoginRequest,
    this.email,
    this.password,
  });

  @override
  State<StatefulWidget> createState() => _EmailPasswordLoginState();
}

class _EmailPasswordLoginState extends State<EmailPasswordForm> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();
  TextStyle style = GoogleFonts.montserrat();
  bool loading = false;
  @override
  void initState() {
    super.initState();
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    _loginEmailController.text = widget.email;
    _loginPasswordController.text = widget.password;


    final emailField = TextFormField(
      controller: _loginEmailController,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (result) {
        if (result.isEmpty) {
          return S.of(context).emailAddressIsRequired;
        }
        return null;
      },
    );

    final passwordField = TextFormField(
      controller: _loginPasswordController,
      obscureText: true,
      style: style,
      validator: (result) {
        if (result.length < 5) {
          return 'Password is too short';
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) =>
          node.unfocus(),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",

          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),

    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: AppThemeDataService.PrimaryDarker,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
                  if (_loginFormKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                        widget.onLoginRequest(
                          _loginEmailController.text,
                          _loginPasswordController.text,
                        );
                      }
        },
        child: loading ?
        CircularProgressIndicator():
        Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _loginFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: emailField,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: passwordField,
            ),
            loginButton,
//          Padding(
//            padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
//            child: Flex(
//              direction: Axis.vertical,
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: [
//                Padding(
//                  padding: const EdgeInsets.all(16.0),
//                  child: GestureDetector(
//                    onTap: () {
//                      Navigator.of(context)
//                          .pushNamed(AuthorizationRoutes.AUTH_SCREEN);
//                    },
//                    child: Text(
//                      'Register',
//                      textAlign: TextAlign.center,
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                  ),
//                ),
//                Container(
//                  child: FlatButton(
//                    color: Theme.of(context).primaryColor,
//                    onPressed: () {
//                      if (_loginFormKey.currentState.validate()) {
//                        setState(() {});
//                        widget.onLoginRequest(
//                          _loginEmailController.text,
//                          _loginPasswordController.text,
//                        );
//                      }
//                    },
//                    child: Padding(
//                      padding: const EdgeInsets.all(16.0),
//                      child: Text(
//                        'Next',
//                        style: TextStyle(
//                          color: Colors.white,
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
          ],
        ),
      ),
    );
  }
}
