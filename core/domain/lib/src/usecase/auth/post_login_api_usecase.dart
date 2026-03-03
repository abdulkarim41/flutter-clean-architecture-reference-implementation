import 'package:domain/domain.dart';
import 'package:entity/entity.dart';

class PostLoginApiUsecase extends ApiUseCaseWithParams<LoginApiParams, LoginApiEntity> {
  final AuthRepository _repository;
  PostLoginApiUsecase(this._repository);

  @override
  Future<Result<LoginApiEntity>> invoke(LoginApiParams params) async {
    return _repository.login(params);
  }
}
