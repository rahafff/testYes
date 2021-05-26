import 'package:inject/inject.dart';

import '../../repository/auth/auth_repository.dart';
import '../../request/login_request/login_request.dart';
import '../../request/register_request/register_request.dart';
import '../../response/login_response/login_response.dart';

@provide
class AuthManager {
  final AuthRepository _authRepository;
  AuthManager(this._authRepository);

  Future<bool> register(RegisterRequest registerRequest) =>
      _authRepository.createUser(registerRequest);

  Future<LoginResponse> login(LoginRequest loginRequest) =>
      _authRepository.getToken(loginRequest);
}
