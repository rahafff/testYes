import 'package:yessoft/consts/urls.dart';
import 'package:yessoft/module_auth/service/auth_service/auth_service.dart';
import 'package:yessoft/module_home/response/home_response/home_response.dart';
import 'package:yessoft/module_network/http_client/http_client.dart';
import 'package:inject/inject.dart';

@provide
class AllProfileRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  AllProfileRepository(
    this._apiClient,
    this._authService,
  );

  Future<AllUser> getAllProfile() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
      Urls.ALL_PROFILE,
      headers: {'Authorization': 'Bearer $token'},
    );
    return AllUser.fromJson(response);
  }
}
