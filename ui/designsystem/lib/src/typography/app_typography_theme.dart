import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

class AppTypographyTheme extends ThemeExtension<AppTypographyTheme> {
  final AppTextStyleData titleLarge;
  final AppTextStyleData titleMedium;
  final AppTextStyleData titleSmall;
  final AppTextStyleData bodyLarge;
  final AppTextStyleData bodyMedium;
  final AppTextStyleData bodySmall;
  final AppTextStyleData bodyXSmall;

  AppTypographyTheme._({
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.bodyXSmall,
  });

  factory AppTypographyTheme.fromColors(TextColorThemeExtension colors) {
    const fontFamily = "Poppins";
    const sizeTitleLarge = 22.0;
    const sizeTitleMedium = 20.0;
    const sizeTitleSmall = 18.0;
    const sizeBodyLarge = 16.0;
    const sizeBodyMedium = 14.0;
    const sizeBodySmall = 12.0;
    const sizeBodyXSmall = 10.0;

    TextStyle make(double size, FontWeight weight) {
      return TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: weight,
        color: colors.neutral,
      );
    }

    return AppTypographyTheme._(
      titleLarge: AppTextStyleData(
        regular: make(sizeTitleLarge, FontWeight.w400),
        medium: make(sizeTitleLarge, FontWeight.w500),
        semibold: make(sizeTitleLarge, FontWeight.w600),
        bold: make(sizeTitleLarge, FontWeight.w700),
      ),
      titleMedium: AppTextStyleData(
        regular: make(sizeTitleMedium, FontWeight.w400),
        medium: make(sizeTitleMedium, FontWeight.w500),
        semibold: make(sizeTitleMedium, FontWeight.w600),
        bold: make(sizeTitleMedium, FontWeight.w700),
      ),
      titleSmall: AppTextStyleData(
        regular: make(sizeTitleSmall, FontWeight.w400),
        medium: make(sizeTitleSmall, FontWeight.w500),
        semibold: make(sizeTitleSmall, FontWeight.w600),
        bold: make(sizeTitleSmall, FontWeight.w700),
      ),
      bodyLarge: AppTextStyleData(
        regular: make(sizeBodyLarge, FontWeight.w400),
        medium: make(sizeBodyLarge, FontWeight.w500),
        semibold: make(sizeBodyLarge, FontWeight.w600),
        bold: make(sizeBodyLarge, FontWeight.w700),
      ),
      bodyMedium: AppTextStyleData(
        regular: make(sizeBodyMedium, FontWeight.w400),
        medium: make(sizeBodyMedium, FontWeight.w500),
        semibold: make(sizeBodyMedium, FontWeight.w600),
        bold: make(sizeBodyMedium, FontWeight.w700),
      ),
      bodySmall: AppTextStyleData(
        regular: make(sizeBodySmall, FontWeight.w400),
        medium: make(sizeBodySmall, FontWeight.w500),
        semibold: make(sizeBodySmall, FontWeight.w600),
        bold: make(sizeBodySmall, FontWeight.w700),
      ),
      bodyXSmall: AppTextStyleData(
        regular: make(sizeBodyXSmall, FontWeight.w400),
        medium: make(sizeBodyXSmall, FontWeight.w500),
        semibold: make(sizeBodyXSmall, FontWeight.w600),
        bold: make(sizeBodyXSmall, FontWeight.w700),
      ),
    );
  }

  @override
  ThemeExtension<AppTypographyTheme> copyWith({
    AppTextStyleData? titleLarge,
    AppTextStyleData? titleMedium,
    AppTextStyleData? titleSmall,
    AppTextStyleData? bodyLarge,
    AppTextStyleData? bodyMedium,
    AppTextStyleData? bodySmall,
    AppTextStyleData? bodyXSmall,
  }) {
    return AppTypographyTheme._(
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      bodyXSmall: bodyXSmall ?? this.bodyXSmall,
    );
  }

  @override
  ThemeExtension<AppTypographyTheme> lerp(
    covariant ThemeExtension<AppTypographyTheme>? other,
    double t,
  ) {
    if (other is! AppTypographyTheme) return this;

    return other;
  }
}
