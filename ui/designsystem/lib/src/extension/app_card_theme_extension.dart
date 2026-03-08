import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

final class AppCardThemeExtension extends ThemeExtension<AppCardThemeExtension> {
  final AppCardStyle filled;
  final AppCardStyle outlined;
  final AppCardStyle elevated;
  final EdgeInsets padding;
  final BorderRadius radius;

  const AppCardThemeExtension({
    required this.filled,
    required this.outlined,
    required this.elevated,
    required this.padding,
    required this.radius,
  });

  factory AppCardThemeExtension.light() => AppCardThemeExtension(
    filled: const AppCardStyle(
        background: Colors.white, border: Color(0xFFE5E5E5), elevation: 0),
    outlined: const AppCardStyle(
        background: Colors.white, border: Color(0xFFE5E5E5), elevation: 0),
    elevated: const AppCardStyle(
        background: Colors.white, border: Colors.transparent, elevation: 2),
    padding: const EdgeInsets.all(16),
    radius: BorderRadius.circular(12),
  );

  factory AppCardThemeExtension.dark() => AppCardThemeExtension(
    filled: const AppCardStyle(
        background: Color(0xFF1E1E1E), border: Color(0xFF2C2C2C), elevation: 0),
    outlined: const AppCardStyle(
        background: Color(0xFF1E1E1E), border: Color(0xFF3A3A3A), elevation: 0),
    elevated: const AppCardStyle(
        background: Color(0xFF1E1E1E), border: Colors.transparent, elevation: 3),
    padding: const EdgeInsets.all(16),
    radius: BorderRadius.circular(12),
  );

  @override
  ThemeExtension<AppCardThemeExtension> copyWith({
    AppCardStyle? filled,
    AppCardStyle? outlined,
    AppCardStyle? elevated,
    EdgeInsets? padding,
    BorderRadius? radius,
  }) =>
      AppCardThemeExtension(
        filled: filled ?? this.filled,
        outlined: outlined ?? this.outlined,
        elevated: elevated ?? this.elevated,
        padding: padding ?? this.padding,
        radius: radius ?? this.radius,
      );

  @override
  ThemeExtension<AppCardThemeExtension> lerp(
      ThemeExtension<AppCardThemeExtension>? other, double t) {
    if (other is! AppCardThemeExtension) return this;
    return AppCardThemeExtension(
      filled: AppCardStyle(
        background: Color.lerp(filled.background, other.filled.background, t)!,
        border: Color.lerp(filled.border, other.filled.border, t)!,
        elevation: lerpDouble(filled.elevation, other.filled.elevation, t),
      ),
      outlined: AppCardStyle(
        background: Color.lerp(outlined.background, other.outlined.background, t)!,
        border: Color.lerp(outlined.border, other.outlined.border, t)!,
        elevation: lerpDouble(outlined.elevation, other.outlined.elevation, t),
      ),
      elevated: AppCardStyle(
        background: Color.lerp(elevated.background, other.elevated.background, t)!,
        border: Color.lerp(elevated.border, other.elevated.border, t)!,
        elevation: lerpDouble(elevated.elevation, other.elevated.elevation, t),
      ),
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      radius: BorderRadius.lerp(radius, other.radius, t)!,
    );
  }

  double lerpDouble(double a, double b, double t) => a + (b - a) * t;
}