import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yessoft/module_profile/response/profile_response/profile_response.dart';
import 'package:yessoft/module_profile/service/profile/profile.service.dart';
import 'package:yessoft/module_theme/service/theme_service/theme_service.dart';

import '../../profile_routes.dart';

class EditProfileScreen extends StatefulWidget {
  final ProfileService service;
  final Data model;
  EditProfileScreen(this.service, this.model);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();

  bool update;
  @override
  void initState() {
    super.initState();
    update=false;

    _nameController..text = widget.model.userName;
    _cityController..text = widget.model.city;
    _storyController..text = widget.model.story;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: AppThemeDataService.PrimaryDarker,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          InkWell(
            onTap: () async{
             bool n =await editPro();
              if(n){
                  await Navigator.of(context)
                      .pop();
              }
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 15 ,top: 10),
              child: Text("save" , style: TextStyle(color: Colors.white ,fontSize: 20),),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/pro.jpg')),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'name',
                style: TextStyle(
                    color: AppThemeDataService.PrimaryDarker, fontSize: 18),
              ),
              subtitle: TextField(
                controller: _nameController,
              ),
            ),
            ListTile(
                title: Text(
                  'city',
                  style: TextStyle(
                      color: AppThemeDataService.PrimaryDarker, fontSize: 18),
                ),
                subtitle: TextField(
                  controller: _cityController,
                )),
            ListTile(
                title: Text('story',
                    style: TextStyle(
                        color: AppThemeDataService.PrimaryDarker,
                        fontSize: 18)),
                subtitle: TextField(
                  controller: _storyController,
                )),
          ],
        ),
      ),
    );
  }


 Future<bool> editPro() async {
   update =  await widget.service.updateProfile(_nameController.text, _cityController.text, _storyController.text);
   return update;
  }
}
