import 'package:common/src/secure_storage/secure_storage.dart';
import 'package:common/src/sharedpref/shared_prefs.dart';
import 'package:get_it/get_it.dart';

void init() {
  GetIt.I.registerSingletonAsync<SharedPrefs>(() async {
    final prefs = SharedPrefs();
    await prefs.init();

    return prefs;
  });

  GetIt.I.registerSingleton<SecureStorage>(SecureStorage());
}
