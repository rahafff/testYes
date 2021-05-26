//import 'package:yessoft/module_auth/enums/user_type.dart';
//import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
//
//import '../../../ui/states/auth_states/auth_state.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//
//class AuthStateCodeSent extends AuthState {
//  final _confirmationController = TextEditingController();
//  bool retryEnabled = false;
//  bool loading = false;
//
//  AuthStateCodeSent(AuthStateManager screen) : super(screen) {
//    Future.delayed(Duration(seconds: 30), () {
//      retryEnabled = true;
//    });
//  }
//
//  @override
//  Widget getUI(BuildContext context) {
//    return Form(
//      child: Flex(
//        direction: Axis.vertical,
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: [
//          MediaQuery.of(context).viewInsets.bottom == 0
//              ? Image.asset('assets/images/logo.jpg')
//              : Container(),
//          Padding(
//            padding: const EdgeInsets.all(16.0),
//            child: TextFormField(
//                controller: _confirmationController,
//                decoration: InputDecoration(
//                  labelText: 'Confirm Code',
//                  hintText: '12345',
//                ),
//                keyboardType: TextInputType.number,
//                validator: (v) {
//                  if (v.isEmpty) {
//                    return 'Phone Number is required';
//                  }
//                  return null;
//                }),
//          ),
//          OutlinedButton(
//            onPressed: retryEnabled
//                ? () {
//                    stateManager.retryPhone();
//                  }
//                : null,
//            child: Text('Resend Code'),
//          ),
//          loading
//              ? Text('Loading')
//              : Container(
//                  decoration:
//                      BoxDecoration(color: Theme.of(context).accentColor),
//                  child: GestureDetector(
//                    onTap: () {
//                      loading = true;
//                      Future.delayed(Duration(seconds: 10), () {
//                        loading = false;
//                      });
//                      stateManager.confirmSmsCode(
//                          _confirmationController.text, UserRole.ROLE_OWNER);
//                    },
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Padding(
//                          padding: const EdgeInsets.all(16.0),
//                          child: Text(
//                            'Confirm',
//                            style: TextStyle(
//                              fontSize: 20,
//                              fontWeight: FontWeight.bold,
//                              color: Colors.white,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//        ],
//      ),
//    );
//  }
//}
