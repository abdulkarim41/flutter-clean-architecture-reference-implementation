import  'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

extension AppThemeExtension on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;

  BackgroundColorThemeExtension get backgroundColorTheme =>
      appTheme.backgroundColorTheme;

}

