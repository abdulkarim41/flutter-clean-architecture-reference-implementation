import 'package:envied/envied.dart';
import 'package:secret_env/src/env/app_env.dart';
import 'env_fields.dart';

part 'development_env.g.dart';

@Envied(name: 'Env', path: '.env_development')
final class DevelopmentEnv implements AppEnv, EnvFields {
  DevelopmentEnv();

  @override
  @EnviedField(varName: 'API_BASE_URL', obfuscate: true)
  final String apiBaseUrl = _Env.apiBaseUrl;
}
