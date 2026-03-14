import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

final class AppButtonThemeExtension extends ThemeExtension<AppButtonThemeExtension> {

  factory AppButtonThemeExtension.light() {
    return AppButtonThemeExtension(
      primary: ButtonColorSet(
        filled: ButtonColor.filled(
          background: AppColors.primary,
          foreground: AppColors.white,
          disableBackground: AppColors.primaryDark,
          disableForeground: AppColors.white,
        ),
        outline: ButtonColor.outline(
          border: AppColors.primary,
          foreground: AppColors.primary,
        ),
        textAndIconOnly: ButtonColor.textAndIconOnly(
          foreground: AppColors.primary,
        ),
      ),
      secondary: ButtonColorSet(
        filled: ButtonColor.filled(
          background: AppColors.secondary,
          foreground: AppColors.white,
        ),
        outline: ButtonColor.outline(
          border: AppColors.secondary,
          foreground: AppColors.secondary,
        ),
        textAndIconOnly: ButtonColor.textAndIconOnly(
          foreground: AppColors.secondary,
        ),
      ),
    );
  }

  factory AppButtonThemeExtension.dark() {
    return AppButtonThemeExtension(
      primary: ButtonColorSet(
        filled: ButtonColor.filled(
          background: AppColors.grey700,
          foreground: AppColors.white,
          disableBackground: AppColors.grey100,
          disableForeground: AppColors.white,
        ),
        outline: ButtonColor.outline(
          border: AppColors.grey700,
          foreground: AppColors.grey700,
          disableBorder: AppColors.grey100,
        ),
        textAndIconOnly: ButtonColor.textAndIconOnly(
          foreground: AppColors.grey700,
          disableForeground: AppColors.grey100,
        ),

      ),
      secondary: ButtonColorSet(
        filled: ButtonColor.filled(
          background: AppColors.secondary,
          foreground: AppColors.white,
        ),
        outline: ButtonColor.outline(
          border: AppColors.secondary,
          foreground: AppColors.secondary,
        ),
        textAndIconOnly: ButtonColor.textAndIconOnly(
          foreground: AppColors.secondary,
        ),
      ),
    );
  }

  final ButtonColorSet primary;
  final ButtonColorSet secondary;

  const AppButtonThemeExtension({
    required this.primary,
    required this.secondary,
  });

  @override
  AppButtonThemeExtension copyWith({
    ButtonColorSet? primary,
    ButtonColorSet? secondary,
  }) {
    return AppButtonThemeExtension(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
    );
  }

  @override
  ThemeExtension<AppButtonThemeExtension> lerp(
      ThemeExtension<AppButtonThemeExtension>? other,
      double t,
      ) {
    if (other is! AppButtonThemeExtension) return this;
    return other;
  }
}
