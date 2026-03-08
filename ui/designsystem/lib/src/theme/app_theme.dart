import 'package:flutter/material.dart';
import 'package:designsystem/designsystem.dart';

final class AppTheme extends ThemeExtension<AppTheme> {

  final BackgroundColorThemeExtension backgroundColorTheme;
  final AppButtonThemeExtension buttonThemeExtension;
  final AppCardThemeExtension cardThemeExtension;
  final AppTextFieldThemeExtension textFieldThemeExtension;

  const AppTheme._({
    required this.backgroundColorTheme,
    required this.buttonThemeExtension,
    required this.cardThemeExtension,
    required this.textFieldThemeExtension,
  });

  @override
  ThemeExtension<AppTheme> copyWith({
    BackgroundColorThemeExtension? backgroundColorTheme,
    AppButtonThemeExtension? buttonThemeExtension,
    AppCardThemeExtension? cardThemeExtension,
    AppTextFieldThemeExtension? textFieldThemeExtension,
  }) {
    return AppTheme._(
      backgroundColorTheme: backgroundColorTheme ?? this.backgroundColorTheme,
      buttonThemeExtension: buttonThemeExtension ?? this.buttonThemeExtension,
      cardThemeExtension: cardThemeExtension ?? this.cardThemeExtension,
      textFieldThemeExtension: textFieldThemeExtension ?? this.textFieldThemeExtension,
    );
  }

  factory AppTheme.light() {
    return AppTheme._(
      backgroundColorTheme: BackgroundColorThemeExtension.light(),
      buttonThemeExtension: AppButtonThemeExtension.light(),
      cardThemeExtension: AppCardThemeExtension.light(),
      textFieldThemeExtension: AppTextFieldThemeExtension.light(),
    );
  }

  factory AppTheme.dark() {
    return AppTheme._(
      backgroundColorTheme: BackgroundColorThemeExtension.dark(),
      buttonThemeExtension: AppButtonThemeExtension.dark(),
      cardThemeExtension: AppCardThemeExtension.dark(),
      textFieldThemeExtension: AppTextFieldThemeExtension.dark(),
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) return this;
    return other;
  }

}

// class LightTheme {
//
//   static ThemeData theme = ThemeData(
//     brightness: Brightness.light,
//
//     primaryColor: AppColors.primary,
//
//     scaffoldBackgroundColor: Colors.white,
//
//     colorScheme: const ColorScheme.light(
//       primary: AppColors.primary,
//       secondary: AppColors.secondary,
//     ),
//   );
// }
//
// class DarkTheme {
//
//   static ThemeData theme = ThemeData(
//     brightness: Brightness.dark,
//
//     primaryColor: AppColors.primary,
//
//     scaffoldBackgroundColor: Colors.black,
//
//     colorScheme: const ColorScheme.dark(
//       primary: AppColors.primary,
//     ),
//
//     appBarTheme: const AppBarTheme(
//       elevation: 0,
//       backgroundColor: Colors.black,
//     ),
//   );
// }
