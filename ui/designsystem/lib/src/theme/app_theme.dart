import 'package:flutter/material.dart';
import 'package:designsystem/designsystem.dart';

class AppTheme {

  static ThemeData light = LightTheme.theme;
  static ThemeData dark = DarkTheme.theme;

}

class LightTheme {

  static ThemeData theme = ThemeData(
    brightness: Brightness.light,

    primaryColor: AppColors.primary,

    scaffoldBackgroundColor: Colors.white,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  );
}

class DarkTheme {

  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,

    primaryColor: AppColors.primary,

    scaffoldBackgroundColor: Colors.black,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.black,
    ),
  );
}