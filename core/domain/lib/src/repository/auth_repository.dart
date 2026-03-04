import 'package:domain/domain.dart';
import 'package:entity/entity.dart';

abstract class AuthRepository {

  Future<Result<LoginApiEntity>> login(LoginApiParams params);
  Future<Result<ProfileApiEntity>> fetchProfile();

}
