import 'package:inject/inject.dart';

import 'package:yessoft/consts/urls.dart';
import 'package:yessoft/module_network/http_client/http_client.dart';

import '../../request/login_request/login_request.dart';
import '../../request/register_request/register_request.dart';
import '../../response/login_response/login_response.dart';

@provide
class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(this._apiClient);

  Future<bool> createUser(RegisterRequest request) async {
    var result = await _apiClient.post(Urls.API_SIGN_UP, request.toJson());

    return result != null;
  }

  Future<LoginResponse> getToken(LoginRequest loginRequest) async {
    var result = await _apiClient.post(
      Urls.CREATE_TOKEN_API,
      loginRequest.toJson(),
    );

    if (result == null) {
      return null;
    }
    return LoginResponse.fromJson(result);
  }
}
