//import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:yessoft/module_auth/enums/auth_source.dart';
//import 'package:yessoft/module_auth/ui/widget/email_password_login/email_password_login.dart';
//import 'package:yessoft/module_auth/ui/widget/phone_login/phone_login.dart';
//
//class AuthOptionsForm extends StatefulWidget {
//  final Function(String email, String password)
//  requestEmailAndPasswordSignIn;
//
//
//  AuthOptionsForm({
//    this.requestEmailAndPasswordSignIn,
//  });
//
//  @override
//  State<StatefulWidget> createState() => _AuthOptionsFormState();
//}
//
//class _AuthOptionsFormState extends State<AuthOptionsForm> {
////  AuthSource _authSource;
//
//  @override
//  Widget build(BuildContext context) {
//    return _getActiveCard();
//  }
//
//  Widget _getActiveCard() {
//
////    switch (_authSource) {
////      case AuthSource.PHONE:
////        return Flex(
////          direction: Axis.vertical,
////          children: [
////            ListTile(
////              leading: Container(
////                child: IconButton(
////                  icon: Icon(Icons.chevron_left),
////                  onPressed: () {
////                    _authSource = AuthSource.OTHER;
////                    setState(() {});
////                  },
////                ),
////              ),
////              title: Text('Back'),
////            ),
////            Expanded(
////              child: PhoneLoginWidget(
////              onLoginRequested: (phone) {
////                widget.requestPhoneSignIn(phone);
////              },
////          ),
////            ),],
////        );
////        break;
////      case AuthSource.EMAIL:
////        return Flex(
////          direction: Axis.vertical,
////          children: [
////            ListTile(
////              leading: Container(
////                child: IconButton(
////                  icon: Icon(Icons.chevron_left),
////                  onPressed: () {
////                    _authSource = AuthSource.OTHER;
////                    setState(() {});
////                  },
////                ),
////              ),
////              title: Text('Back'),
////            ),
////            Expanded(
////              child: EmailPasswordForm(
////                onLoginRequest: (email, password) {
////                  widget.requestEmailAndPasswordSignIn(email, password);
////                },
////              ),
////            ),
////          ],
////        );
////        break;
////      default:
////        return Flex(
////          direction: Axis.vertical,
////          crossAxisAlignment: CrossAxisAlignment.stretch,
////          children: [
////            Container(
////              padding: const EdgeInsets.all(36.0),
////              child: FlutterLogo(),
////            ),
////            Expanded(
////                child: Padding(
////              padding: const EdgeInsets.all(24.0),
////              child: Flex(
////                direction: Axis.vertical,
////                mainAxisAlignment: MainAxisAlignment.center,
////                children: [
////                  ListTile(
////                    leading: FaIcon(
////                      FontAwesomeIcons.apple,
////                      color: Colors.black,
////                    ),
////                    title: Text('Sign in with Apple'),
////                  ),
////                  Divider(),
////                  GestureDetector(
////                    onTap: () {
////                      setState(() {
////                        _authSource = AuthSource.EMAIL;
////                      });
////                    },
////                    child: ListTile(
////                      leading: Icon(Icons.email, color: Colors.black),
////                      title: Text('Sign in with email address'),
////                    ),
////                  ),
////                  Divider(),
////                  GestureDetector(
////                    onTap: () {
////                      setState(() {
////                        _authSource = AuthSource.PHONE;
////                      });
////                    },
////                    child: ListTile(
////                      leading: FaIcon(
////                        FontAwesomeIcons.phoneAlt,
////                        color: Colors.black,
////                      ),
////                      title: Text('Sign in with Phone Number'),
////                    ),
////                  ),
////                  Divider(),
////                  GestureDetector(
////                    onTap: () {
////                      widget.requestGoogleSignIn();
////                    },
////                    child: ListTile(
////                      title: Text('Sign in with Google'),
////                      leading: FaIcon(
////                        FontAwesomeIcons.google,
////                        color: Colors.blue,
////                      ),
////                    ),
////                  ),
////                ],
////              ),
////            ))
////          ],
////        );
////        break;
////    }
//  }
//}
