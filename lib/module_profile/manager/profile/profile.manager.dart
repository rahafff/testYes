import 'package:yessoft/module_profile/repository/profile/profile.repository.dart';
import 'package:yessoft/module_profile/request/branch/create_branch_request.dart';
import 'package:yessoft/module_profile/request/profile/profile_request.dart';
import 'package:inject/inject.dart';

@provide
class ProfileManager {
  final ProfileRepository _repository;

  ProfileManager(
    this._repository,
  );

  Future<bool> createProfile(ProfileRequest profileRequest) async =>
      await _repository.createProfile(profileRequest);


}
