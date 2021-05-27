import 'package:yessoft/module_profile/manager/profile/profile.manager.dart';
import 'package:yessoft/module_profile/request/profile/profile_request.dart';
import 'package:inject/inject.dart';

@provide
class ProfileService {
  final ProfileManager _manager;

  ProfileService(
    this._manager,
  );

  Future<bool> createProfile(String city, String username , String story) async {
    ProfileRequest profileRequest = new ProfileRequest(
      userName: username ,
      city: city,
      story: story
    );

    return await _manager.updateProfile(profileRequest);
  }

}
