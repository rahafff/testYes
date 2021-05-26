import 'package:yessoft/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';

import 'authorization_routes.dart';
import 'ui/screen/login_screen/auth_screen.dart';

@provide
class AuthorizationModule extends YesModule {
  final AuthScreen _authScreen;
  AuthorizationModule(this._authScreen);

  @override
  Map<String, WidgetBuilder> getRoutes() {
    return {
      AuthorizationRoutes.AUTH_SCREEN: (context) => _authScreen,
    };
  }
}
