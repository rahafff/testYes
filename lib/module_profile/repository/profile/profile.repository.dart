import 'package:yessoft/consts/urls.dart';
import 'package:yessoft/module_auth/service/auth_service/auth_service.dart';
import 'package:yessoft/module_network/http_client/http_client.dart';
import 'package:yessoft/module_profile/request/profile/profile_request.dart';
import 'package:inject/inject.dart';
import 'package:yessoft/module_profile/response/profile_response/profile_response.dart';

@provide
class ProfileRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  ProfileRepository(
    this._apiClient,
    this._authService,
  );

  Future<bool> updateProfile(ProfileRequest profileRequest) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.put(
      Urls.PROFILE,
      profileRequest.toJson(),
      headers: {'Authorization': 'Bearer $token'},
    );

    print(response);
    if (response['status_code'] == '204') return true;

    return false;
  }

  Future<Data> getProfile( ) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
      Urls.PROFILE,
      headers: {'Authorization': 'Bearer $token'},
    );

      return ProfileModel.fromJson(response).data;
  }
}
