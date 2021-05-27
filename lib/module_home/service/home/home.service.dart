import 'package:yessoft/module_auth/state_manager/auth_state_manager/auth_state_manager.dart';
import 'package:yessoft/module_home/manager/home/home.manager.dart';
import 'package:yessoft/module_home/response/home_response/home_response.dart';
import 'package:inject/inject.dart';

@provide
class AllProfileService {
  final AuthStateManager _manager;

  AllProfileService(
    this._manager,
  );
//
//  Future<AllUser> getAllProfile() async {
//    return await _manager.getAllProfile();
//  }

}
