import 'package:common/common.dart';
import 'package:data/src/client/network_client.dart';
import 'package:data/src/di/di_annotations.dart';
import 'package:data/src/di/repository_di_module.dart';
import 'package:get_it/get_it.dart';
import 'package:secret_env/secret_env.dart';

Future<void> registerDataDiModule() async {
  GetIt.I.registerLazySingleton<NetworkClient>(
    () => NetworkClient(baseUrl: AppEnv().apiBaseUrl,secureStorage: GetIt.I<SecureStorage>()),
    instanceName: DIAnnotations.baseURL.toString(),
  );

  await registerRepoImplDiModule();

  return;
}
