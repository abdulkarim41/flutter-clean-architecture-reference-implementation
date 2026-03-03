import 'dart:async';
import 'package:app/application/my_application.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:app/di/di_modules.dart';

void runMainApp(ApplicationFlavorType type) async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // Initialize Application Flavor
      safeSync("ApplicationFlavor.init", () => ApplicationFlavor.init(type));

      // Initialize Dependency Injection
      await safeAsync("Service locator", () async {
        await registerServiceLocator().timeout(const Duration(seconds: 8));
        await GetIt.I.allReady().timeout(const Duration(seconds: 8));
      });

      runApp(const MyApplication());
    },
    (e, s) {
      Logcat.log('Uncaught zone error: $e\n$s');
    },
  );
}
