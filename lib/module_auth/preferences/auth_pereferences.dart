import 'package:inject/inject.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../enums/user_type.dart';

@provide
class AuthPreferences {

  Future<void> setToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString('token', token);
  }

  Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
  }

  Future<void> deleteToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove('token');
  }
}