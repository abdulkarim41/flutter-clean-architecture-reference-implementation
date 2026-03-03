import 'package:secret_env/src/env/development_env.dart';
import 'package:secret_env/src/env/env_fields.dart';
import 'package:secret_env/src/env/production_env.dart';
import 'package:common/common.dart';

abstract interface class AppEnv implements EnvFields {
  factory AppEnv() => _instance;
  static final AppEnv _instance =
      ApplicationFlavor.instance.flavor.isDevelopment
      ? DevelopmentEnv()
      : ProductionEnv();
}
