import 'package:flutter/cupertino.dart';

@immutable
class LoginApiEntity {
  final String accessToken;
  final String refreshToken;

  const LoginApiEntity({
    required this.accessToken,
    required this.refreshToken,
  });
}
