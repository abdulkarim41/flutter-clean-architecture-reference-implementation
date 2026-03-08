import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

final class TextColorThemeExtension extends ThemeExtension<TextColorThemeExtension>{

  factory TextColorThemeExtension.light() => TextColorThemeExtension._(
    neutral: AppColors.grey700,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    secondaryDark: AppColors.secondaryDark,
    white: AppColors.white,
    warning: AppColors.warning,
    error: AppColors.error,
  );

  factory TextColorThemeExtension.dark() => TextColorThemeExtension.light();

  final Color neutral;
  final Color primary;
  final Color secondary;
  final Color secondaryDark;
  final Color warning;
  final Color white;
  final Color error;

  const TextColorThemeExtension._({
    required this.neutral,
    required this.primary,
    required this.secondary,
    required this.secondaryDark,
    required this.warning,
    required this.white,
    required this.error,
  });

  @override
  TextColorThemeExtension copyWith({
    Color? neutral,
    Color? primary,
    Color? secondary,
    Color? secondaryDark,
    Color? warning,
    Color? white,
    Color? error,
  }) {
    return TextColorThemeExtension._(
      neutral: neutral ?? this.neutral,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      secondaryDark: secondaryDark ?? this.secondaryDark,
      warning: warning ?? this.warning,
      white: white ?? this.white,
      error: error ?? this.error,
    );
  }

  @override
  ThemeExtension<TextColorThemeExtension> lerp(covariant ThemeExtension<TextColorThemeExtension>? other, double t,) {
    if (other is! TextColorThemeExtension) return this;

    return other;
  }

}