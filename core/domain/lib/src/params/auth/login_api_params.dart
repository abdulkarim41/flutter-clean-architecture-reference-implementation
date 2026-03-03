import 'package:domain/src/api_params_annotation.dart';

part 'login_api_params.g.dart';

@apiParams
class LoginApiParams {
  final String username;
  final String password;

  LoginApiParams({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginApiParamsToJson(this);
}
