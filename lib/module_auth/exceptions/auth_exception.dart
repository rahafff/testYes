import 'dart:core';

class TokenExpiredException implements Exception {
  final String msg;

  const TokenExpiredException(this.msg);

  @override
  String toString() => 'TokenExpiredException ${msg}';
}

class UnauthorizedException implements Exception {
  final String msg;

  const UnauthorizedException(this.msg);

  @override
  String toString() => msg;
}

class LoginException implements Exception {
  final String msg;

  const LoginException(this.msg);

  @override
  String toString() => msg;
}