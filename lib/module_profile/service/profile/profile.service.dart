import 'package:yessoft/module_profile/manager/profile/profile.manager.dart';
import 'package:yessoft/module_profile/request/branch/create_branch_request.dart';
import 'package:yessoft/module_profile/request/profile/profile_request.dart';
import 'package:inject/inject.dart';

@provide
class ProfileService {
  final ProfileManager _manager;

  ProfileService(
    this._manager,
  );

  Future<bool> createProfile(String city, int branch) async {
    ProfileRequest profileRequest = new ProfileRequest(
      city: city,
      branch: branch,
    );

    return await _manager.createProfile(profileRequest);
  }

}
