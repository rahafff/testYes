import 'package:firebase_auth/firebase_auth.dart';

import '../enums/auth_source.dart';
import '../enums/user_type.dart';

class AppUser {
  User credential;
//  AuthSource authSource;
//  UserRole userRole;
  String username;
  String password;

  AppUser(this.credential ,this.password, this.username);
}
