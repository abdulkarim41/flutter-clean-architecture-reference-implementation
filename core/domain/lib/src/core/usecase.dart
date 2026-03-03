import 'package:domain/domain.dart';

abstract class UseCase{}

abstract class ApiUseCaseWithParams<Params, Type> extends UseCase{
  Future<Result<Type>> invoke(Params params);
}

abstract class ApiUseCaseWithoutParams<Type> extends UseCase{
  Future<Result<Type>> invoke();
}
