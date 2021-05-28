import 'package:flutter/cupertino.dart';
import 'package:inject/inject.dart';
import 'package:yessoft/abstracts/module/yes_module.dart';
import 'package:yessoft/module_profile/profile_routes.dart';
import 'package:yessoft/module_profile/ui/screen/edit_profile_screen.dart';
import 'package:yessoft/module_profile/ui/screen/profile_screen.dart';


@provide
class ProfileModule extends YesModule {
  final ProfileScreen _profileScreen;
//  final EditProfileScreen _editProfileScreen;

  ProfileModule(this._profileScreen
//      , this._editProfileScreen
      );

  @override
  Map<String, WidgetBuilder> getRoutes() {
    return {ProfileRoutes.ROUTE_Profile: (context) => _profileScreen
      ,
//      ProfileRoutes.ROUTE_EDIT_PROFILE: (context) => _editProfileScreen
    };
  }
}