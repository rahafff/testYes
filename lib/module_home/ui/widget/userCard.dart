import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yessoft/module_home/response/home_response/home_response.dart';

class UserCard extends StatelessWidget {
 final Datum user;

  const UserCard({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.userName),
              Text(user.city)
            ],
          ),
        ) ,
      ),
    );
  }
}
