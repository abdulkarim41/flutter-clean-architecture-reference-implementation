
import 'package:apiresponse/apiresponse.dart';
import 'package:entity/entity.dart';

abstract class ProfileApiMapper {

  const ProfileApiMapper._();

  static ProfileApiEntity toEntity(ProfileApiResponse response) {
    return ProfileApiEntity(
      email: response.email ?? "",
      firstName: response.firstName ?? "",
      lastName: response.lastName ?? "",
      gender: response.gender ?? "",
      imageUrl: response.image ?? "",
    );
  }

}