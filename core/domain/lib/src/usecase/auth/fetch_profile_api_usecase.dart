import 'package:domain/domain.dart';
import 'package:entity/entity.dart';

class FetchProfileApiUsecase extends ApiUseCaseWithoutParams<ProfileApiEntity> {
  final AuthRepository _repository;
  FetchProfileApiUsecase(this._repository);

  @override
  Future<Result<ProfileApiEntity>> invoke() async {
    return _repository.fetchProfile();
  }
}
