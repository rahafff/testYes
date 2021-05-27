import 'package:inject/inject.dart';

import 'package:yessoft/consts/urls.dart';
import 'package:yessoft/module_auth/preferences/auth_pereferences.dart';
import 'package:yessoft/module_home/response/home_response/home_response.dart';
import 'package:yessoft/module_network/http_client/http_client.dart';

import '../../request/login_request/login_request.dart';
import '../../request/register_request/register_request.dart';
import '../../response/login_response/login_response.dart';

@provide
class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(this._apiClient);

  Future<bool> createUser(RegisterRequest request) async {
    var result = await _apiClient.post(Urls.SIGN_UP, request.toJson());

    return result != null;
  }

  Future<LoginResponse> getToken(LoginRequest loginRequest) async {
    var result = await _apiClient.post(
      Urls.LOGIN,
      loginRequest.toJson(),
    );

    if (result == null) {
      return null;
    }
    return LoginResponse.fromJson(result);
  }

  Future<AllUser> getAllProfile() async {
    final AuthPreferences _prefsHelper =AuthPreferences();
    var token = await _prefsHelper.getToken();
    dynamic response = await _apiClient.get(
      Urls.ALL_PROFILE,
      headers: {'Authorization': 'Bearer $token'},
    );
    return AllUser.fromJson(response);
  }
}
