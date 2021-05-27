import 'package:yessoft/module_home/repository/home/home.repository.dart';
import 'package:yessoft/module_home/response/home_response/home_response.dart';
import 'package:yessoft/module_profile/request/profile/profile_request.dart';
import 'package:inject/inject.dart';

@provide
class AllProfileManager {
  final AllProfileRepository _repository;

  AllProfileManager(
    this._repository,
  );

  Future<AllUser> getAllProfile() async =>
      await _repository.getAllProfile();

}
