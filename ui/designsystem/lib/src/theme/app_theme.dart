import 'package:flutter/material.dart';
import 'package:designsystem/designsystem.dart';

final class AppTheme extends ThemeExtension<AppTheme> {

  final BackgroundColorThemeExtension backgroundColorTheme;
  final AppButtonThemeExtension buttonThemeExtension;
  final AppCardThemeExtension cardThemeExtension;
  final AppTextFieldThemeExtension textFieldThemeExtension;
  final TextColorThemeExtension textColorThemeExtension;
  final AppTypographyTheme appTypographyTheme;

  const AppTheme._({
    required this.backgroundColorTheme,
    required this.buttonThemeExtension,
    required this.cardThemeExtension,
    required this.textFieldThemeExtension,
    required this.textColorThemeExtension,
    required this.appTypographyTheme,
  });

  @override
  ThemeExtension<AppTheme> copyWith({
    BackgroundColorThemeExtension? backgroundColorTheme,
    AppButtonThemeExtension? buttonThemeExtension,
    AppCardThemeExtension? cardThemeExtension,
    AppTextFieldThemeExtension? textFieldThemeExtension,
    TextColorThemeExtension? textColorThemeExtension,
    AppTypographyTheme? appTypographyTheme,
  }) {
    return AppTheme._(
      backgroundColorTheme: backgroundColorTheme ?? this.backgroundColorTheme,
      buttonThemeExtension: buttonThemeExtension ?? this.buttonThemeExtension,
      cardThemeExtension: cardThemeExtension ?? this.cardThemeExtension,
      textFieldThemeExtension: textFieldThemeExtension ?? this.textFieldThemeExtension,
      textColorThemeExtension: textColorThemeExtension ?? this.textColorThemeExtension,
      appTypographyTheme: appTypographyTheme ?? this.appTypographyTheme,
    );
  }

  factory AppTheme.light() {
    return AppTheme._(
      backgroundColorTheme: BackgroundColorThemeExtension.light(),
      buttonThemeExtension: AppButtonThemeExtension.light(),
      cardThemeExtension: AppCardThemeExtension.light(),
      textFieldThemeExtension: AppTextFieldThemeExtension.light(),
      textColorThemeExtension: TextColorThemeExtension.light(),
      appTypographyTheme: AppTypographyTheme.fromColors(TextColorThemeExtension.light()),
    );
  }

  factory AppTheme.dark() {
    return AppTheme._(
      backgroundColorTheme: BackgroundColorThemeExtension.dark(),
      buttonThemeExtension: AppButtonThemeExtension.dark(),
      cardThemeExtension: AppCardThemeExtension.dark(),
      textFieldThemeExtension: AppTextFieldThemeExtension.dark(),
      textColorThemeExtension: TextColorThemeExtension.dark(),
      appTypographyTheme: AppTypographyTheme.fromColors(TextColorThemeExtension.dark()),
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) return this;
    return other;
  }

}
