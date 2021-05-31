import 'dart:developer';

import 'package:yessoft/module_auth/enums/user_type.dart';
import 'package:yessoft/module_auth/service/auth_service/auth_service.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:yessoft/module_auth/ui/widget/drawer/drawer.dart';
import 'package:yessoft/module_home/response/home_response/home_response.dart';
import 'package:yessoft/module_home/ui/screen/home_ui.dart';
import 'package:yessoft/module_home/ui/widget/userCard.dart';
import 'package:yessoft/module_profile/profile_routes.dart';
import 'package:yessoft/module_theme/service/theme_service/theme_service.dart';

import '../../../authorization_routes.dart';
import 'auth_state.dart';

class AuthStateSuccess extends AuthState {
  AuthStateSuccess(AuthStateManager stateManager, AuthService authService)
      : super(stateManager, authService);

  @override
  Widget getUI(BuildContext context) {
    return appHome(
      authService: authService,
      stateManager: stateManager,
    );
  }
}

class appHome extends StatefulWidget {
  final AuthService authService;
  final AuthStateManager stateManager;

  const appHome({Key key, this.authService, this.stateManager})
      : super(key: key);
  @override
  _appHomeState createState() => _appHomeState();
}

class _appHomeState extends State<appHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Biscuit factory",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: false,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppThemeDataService.PrimaryDarker,
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/pro.jpg'))),
                  child: Stack(children: <Widget>[
                    Positioned(
                        bottom: 12.0,
                        left: 16.0,
                        child: Text("Welcome to Biscuit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500))),
                  ])),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.popAndPushNamed(
                              context, ProfileRoutes.ROUTE_Profile)
                          .then((value) {
                            fetchData();
                      });
                    },
                    title: Text("profile"),
                    leading: Icon(Icons.supervised_user_circle ,color: AppThemeDataService.PrimaryDarker,),
                  ),
                  ListTile(
                    title: Text("logout"),
                    leading: Icon(Icons.logout, color: AppThemeDataService.PrimaryDarker,),
                    onTap: () {
                      widget.authService.logout().then((value) {
                        Navigator.pushNamedAndRemoveUntil(context,
                            AuthorizationRoutes.AUTH_SCREEN, (route) => false);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        body: loading
            ? Center(child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(AppThemeDataService.PrimaryDarker),

        ))
            : ListView.builder(
                itemCount: response.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(
                    user: response.data[index],
                  );
                }));
  }

  bool loading = false;
  AllUser response;
  List<Datum> users;

  @override
  void initState() {
    super.initState();
    loading = false;
    users = [];
    fetchData();
    print("back");
  }

  void fetchData() async {
    setState(() {
      loading = true;
      print("helllllo");
    });
    response = await widget.stateManager.getProfiles();

    setState(() {
      loading = false;
    });
  }
}
