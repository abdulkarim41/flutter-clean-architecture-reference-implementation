import 'package:domain/domain.dart';
import 'package:domain/src/params/auth/login_api_params.dart';
import 'package:entity/entity.dart';

abstract class AuthRepository {

  Future<Result<LoginApiEntity>> login(LoginApiParams params);

}
