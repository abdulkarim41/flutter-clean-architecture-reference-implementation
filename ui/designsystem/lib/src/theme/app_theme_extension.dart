import  'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

extension AppThemeExtension on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;

  BackgroundColorThemeExtension get backgroundColorTheme =>
      appTheme.backgroundColorTheme;

  AppButtonThemeExtension get buttonTheme =>
      appTheme.buttonThemeExtension;

  AppCardThemeExtension get cardTheme =>
      appTheme.cardThemeExtension;

  AppTextFieldThemeExtension get textFieldTheme =>
      appTheme.textFieldThemeExtension;

  TextColorThemeExtension get textColorTheme =>
      appTheme.textColorThemeExtension;

  AppTypographyTheme get appTypography =>
      appTheme.appTypographyTheme;

}

