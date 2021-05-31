import 'package:yessoft/module_auth/enums/user_type.dart';
import 'package:yessoft/module_auth/service/auth_service/auth_service.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
import 'package:yessoft/module_auth/ui/states/auth_states/auth_state.dart';
import 'package:yessoft/module_auth/ui/widget/auth_login_option/auth_login_option.dart';
import 'package:yessoft/module_auth/ui/widget/auth_options_form/auth_options_form.dart';
import 'package:flutter/material.dart';


class AuthStateError extends AuthState {
  String errorMsg;

  AuthStateError(AuthStateManager screen, this.errorMsg ,AuthService service) : super(screen,service);

  @override
  Widget getUI(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: LoginForm(
                requestEmailAndPasswordSignIn: (email, password) {
                  stateManager.loginWithUsernameAndPassword(email, password);
                },

              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(errorMsg, maxLines: 3,),
        )
      ],
    );
  }
}
