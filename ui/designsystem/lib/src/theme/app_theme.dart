import 'package:flutter/material.dart';
import 'package:designsystem/designsystem.dart';

final class AppTheme extends ThemeExtension<AppTheme> {

  final BackgroundColorThemeExtension backgroundColorTheme;

  const AppTheme._({
    required this.backgroundColorTheme,
  });

  @override
  ThemeExtension<AppTheme> copyWith({
    BackgroundColorThemeExtension? backgroundColorTheme,
  }) {
    return AppTheme._(
      backgroundColorTheme: backgroundColorTheme ?? this.backgroundColorTheme,
    );
  }

  factory AppTheme.light() {
    return AppTheme._(
      backgroundColorTheme: BackgroundColorThemeExtension.light(),
    );
  }

  factory AppTheme.dark() {
    return AppTheme._(
      backgroundColorTheme: BackgroundColorThemeExtension.dark(),
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
