import 'package:common/common.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

Future<void> registerRepoImplDiModule() async {
  GetIt.I.registerLazySingleton<AuthRepository>(
    () => AuthRepoImpl(
      client: GetIt.I.get<NetworkClient>(
        instanceName: DIAnnotations.baseURL.toString(),
      ),
      sharedPrefs: GetIt.I.get(),
      secureStorage: GetIt.I.get<SecureStorage>(),
    ),
  );

  return;
}
