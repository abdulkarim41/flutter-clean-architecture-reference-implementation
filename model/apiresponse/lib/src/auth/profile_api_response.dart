import 'package:apiresponse/src/api_response_annotation.dart';
part 'profile_api_response.g.dart';

@apiResponse
class ProfileApiResponse {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;

  ProfileApiResponse({
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  });

  factory ProfileApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileApiResponseFromJson(json);
}
