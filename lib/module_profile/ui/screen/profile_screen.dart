import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yessoft/module_auth/service/auth_service/auth_service.dart';
import 'package:yessoft/module_profile/response/profile_response/profile_response.dart';
import 'package:yessoft/module_profile/service/profile/profile.service.dart';
import 'package:yessoft/module_theme/service/theme_service/theme_service.dart';

import '../../profile_routes.dart';
import 'edit_profile_screen.dart';




class ProfileScreen extends StatefulWidget {
  final ProfileService profileService;
  ProfileScreen(this.profileService);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  Data model;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile' , style: TextStyle(color: Colors.white),),
        centerTitle: false,
        backgroundColor: AppThemeDataService.PrimaryDarker,
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen(widget.profileService,model)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.edit , color: Colors.white,),
            ),
          )
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: 50,
                            backgroundImage:
                              AssetImage('assets/images/pro.jpg')),
                        Text(model.userName , style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                  ListTile(title: Text('city' , style: TextStyle(color:AppThemeDataService.PrimaryDarker ,fontSize: 18 ),),subtitle: Text(model.city)),
                  ListTile(title: Text('story' ,style: TextStyle(color:AppThemeDataService.PrimaryDarker ,fontSize: 18 )),subtitle: Text(model.story)),
                ],
              ),
          ),
    );
  }

  @override
  void initState() {
    super.initState();
    isLoading = false;
    model = Data();
    fetchData();
  }

  fetchData() async {
    setState(() {
      isLoading = true;
    });
    model = await widget.profileService.getProfile();
    setState(() {
      isLoading = false;
    });
  }
}
