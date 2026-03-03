import 'package:apiresponse/src/api_response_annotation.dart';
part 'login_api_response.g.dart';

@apiResponse
class LoginApiResponse {
  final String? accessToken;
  final String? refreshToken;

  LoginApiResponse({this.accessToken, this.refreshToken});

  factory LoginApiResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginApiResponseFromJson(json);
}
