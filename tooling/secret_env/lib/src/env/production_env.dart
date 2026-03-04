import 'package:envied/envied.dart';
import 'package:secret_env/src/env/app_env.dart';
import 'env_fields.dart';

part 'production_env.g.dart';

@Envied(name: 'Env', path: '.env_production')
final class ProductionEnv implements AppEnv, EnvFields {
  ProductionEnv();

  @override
  @EnviedField(varName: 'API_BASE_URL', obfuscate: true)
  final String apiBaseUrl = _Env.apiBaseUrl;

}
