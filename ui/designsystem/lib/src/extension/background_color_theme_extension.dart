import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

final class BackgroundColorThemeExtension extends ThemeExtension<BackgroundColorThemeExtension> {

  factory BackgroundColorThemeExtension.light() {
    return const BackgroundColorThemeExtension._(
      backgroundPrimary: AppColors.white,
      backgroundSecondary: AppColors.grey700,
    );
  }

  factory BackgroundColorThemeExtension.dark(){
    return const BackgroundColorThemeExtension._(
      backgroundPrimary: AppColors.black,
      backgroundSecondary: AppColors.white,
    );
  }

  final Color backgroundPrimary;
  final Color backgroundSecondary;

  const BackgroundColorThemeExtension._({
    required this.backgroundPrimary,
    required this.backgroundSecondary,
  });

  @override
  BackgroundColorThemeExtension copyWith({
    Color? backgroundPrimary,
    Color? backgroundSecondary,
  }) {
    return BackgroundColorThemeExtension._(
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
    );
  }

  @override
  ThemeExtension<BackgroundColorThemeExtension> lerp(covariant ThemeExtension<BackgroundColorThemeExtension>? other, double t,) {
    if (other is! BackgroundColorThemeExtension) return this;

    return other;
  }
}