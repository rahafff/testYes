import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yessoft/module_profile/profile_routes.dart';

class DrawerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'John Doe',
                ),
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pro.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title:Text("logout"),
                leading: Icon(Icons.logout),
                onTap:(){

                },
              ),
              ListTile(
                onTap: (){
                  Navigator.pushNamed(context ,ProfileRoutes.ROUTE_Profile);
                },
                title:Text("profile"),
                leading: Icon(Icons.supervised_user_circle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
