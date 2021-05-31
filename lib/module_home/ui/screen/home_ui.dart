import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yessoft/module_auth/service/auth_service/auth_service.dart';
import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
import 'package:yessoft/module_home/response/home_response/home_response.dart';
import 'package:yessoft/module_home/ui/widget/userCard.dart';

class HomeScreen extends StatefulWidget {
final  AuthStateManager manager ;

  const HomeScreen(this.manager);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    response = await widget.manager.getProfiles();

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return
      loading ?
      Center(child: CircularProgressIndicator())
          :
      ListView.builder(
        itemCount: response.data.length,
          itemBuilder: (BuildContext context,int index){
            return UserCard(
              user: response.data[index],
            );
          }
      );

  }
}
