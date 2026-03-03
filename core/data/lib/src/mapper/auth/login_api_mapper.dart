
import 'package:apiresponse/apiresponse.dart';
import 'package:entity/entity.dart';

abstract class LoginApiMapper {

  const LoginApiMapper._();

  static LoginApiEntity toEntity(LoginApiResponse response) {
    return LoginApiEntity(
      accessToken: response.accessToken ?? "",
      refreshToken: response.refreshToken ?? "",
    );
  }

}