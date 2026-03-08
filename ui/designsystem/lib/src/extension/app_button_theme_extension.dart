import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

final class AppButtonThemeExtension extends ThemeExtension<AppButtonThemeExtension> {

  factory AppButtonThemeExtension.light() {
    return AppButtonThemeExtension(
      primary: AppButtonColor(
        background: const Color(0xFF0066FF),
        foreground: Colors.white,
        border: const Color(0xFF0066FF),
      ),
      secondary: AppButtonColor(
        background: Colors.grey.shade200,
        foreground: Colors.black,
        border: Colors.grey.shade300,
      ),
      tertiary: const AppButtonColor(
        background: Colors.transparent,
        foreground: Color(0xFF0066FF),
        border: Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      radius: BorderRadius.circular(12),
    );
  }

  factory AppButtonThemeExtension.dark() {
    return AppButtonThemeExtension(
      primary: AppButtonColor(
        background: Colors.blueGrey,
        foreground: Colors.white,
        border: Colors.blueGrey,
      ),
      secondary: AppButtonColor(
        background: AppColors.grey700,
        foreground: Colors.white,
        border: AppColors.grey700,
      ),
      tertiary: const AppButtonColor(
        background: Colors.transparent,
        foreground: Colors.white,
        border: Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      radius: BorderRadius.circular(12),
    );
  }

  final AppButtonColor primary;
  final AppButtonColor secondary;
  final AppButtonColor tertiary;

  final EdgeInsets padding;
  final BorderRadius radius;

  const AppButtonThemeExtension({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.padding,
    required this.radius,
  });

  @override
  AppButtonThemeExtension copyWith({
    AppButtonColor? primary,
    AppButtonColor? secondary,
    AppButtonColor? tertiary,
    EdgeInsets? padding,
    BorderRadius? radius,
  }) {
    return AppButtonThemeExtension(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      padding: padding ?? this.padding,
      radius: radius ?? this.radius,
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
