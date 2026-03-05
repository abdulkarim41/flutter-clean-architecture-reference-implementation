import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

Future<void> registerUseCaseDiModule() async {
  GetIt.I.registerFactory<PostLoginApiUsecase>(
     () => PostLoginApiUsecase(GetIt.I.get<AuthRepository>()),
  );

  GetIt.I.registerFactory<FetchProfileApiUsecase>(
     () => FetchProfileApiUsecase(GetIt.I.get<AuthRepository>()),
  );
  return;
}
