import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

final class AppTextFieldThemeExtension
    extends ThemeExtension<AppTextFieldThemeExtension> {

  final AppTextFieldStyle filled;
  final AppTextFieldStyle outlined;
  final AppTextFieldStyle underlined;

  final EdgeInsets padding;
  final BorderRadius radius;

  const AppTextFieldThemeExtension({
    required this.filled,
    required this.outlined,
    required this.underlined,
    required this.padding,
    required this.radius,
  });

  factory AppTextFieldThemeExtension.light() {
    return AppTextFieldThemeExtension(
      filled: AppTextFieldStyle(
        enabled: const AppTextFieldStateStyle(
          border: Color(0xFFE0E0E0),
          background: Colors.white,
          text: Colors.black,
          hint: Colors.grey,
        ),
        focused: const AppTextFieldStateStyle(
          border: Color(0xFF0066FF),
          background: Colors.white,
          text: Colors.black,
          hint: Colors.grey,
        ),
        error: const AppTextFieldStateStyle(
          border: Colors.red,
          background: Colors.white,
          text: Colors.black,
          hint: Colors.red,
        ),
        disabled: const AppTextFieldStateStyle(
          border: Color(0xFFDDDDDD),
          background: Color(0xFFF5F5F5),
          text: Colors.grey,
          hint: Colors.grey,
        ),
      ),

      outlined: AppTextFieldStyle(
        enabled: const AppTextFieldStateStyle(
          border: Color(0xFFE0E0E0),
          background: Colors.transparent,
          text: Colors.black,
          hint: Colors.grey,
        ),
        focused: const AppTextFieldStateStyle(
          border: Color(0xFF0066FF),
          background: Colors.transparent,
          text: Colors.black,
          hint: Colors.grey,
        ),
        error: const AppTextFieldStateStyle(
          border: Colors.red,
          background: Colors.transparent,
          text: Colors.black,
          hint: Colors.red,
        ),
        disabled: const AppTextFieldStateStyle(
          border: Color(0xFFDDDDDD),
          background: Colors.transparent,
          text: Colors.grey,
          hint: Colors.grey,
        ),
      ),

      underlined: AppTextFieldStyle(
        enabled: const AppTextFieldStateStyle(
          border: Color(0xFFE0E0E0),
          background: Colors.transparent,
          text: Colors.black,
          hint: Colors.grey,
        ),
        focused: const AppTextFieldStateStyle(
          border: Color(0xFF0066FF),
          background: Colors.transparent,
          text: Colors.black,
          hint: Colors.grey,
        ),
        error: const AppTextFieldStateStyle(
          border: Colors.red,
          background: Colors.transparent,
          text: Colors.black,
          hint: Colors.red,
        ),
        disabled: const AppTextFieldStateStyle(
          border: Color(0xFFDDDDDD),
          background: Colors.transparent,
          text: Colors.grey,
          hint: Colors.grey,
        ),
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      radius: BorderRadius.circular(12),
    );
  }

  factory AppTextFieldThemeExtension.dark() {
    return AppTextFieldThemeExtension(
      filled: AppTextFieldStyle(
        enabled: const AppTextFieldStateStyle(
          border: Color(0xFFE0E0E0),
          background: Colors.white,
          text: Colors.black,
          hint: Colors.grey,
        ),
        focused: const AppTextFieldStateStyle(
          border: Color(0xFF0066FF),
          background: Colors.white,
          text: Colors.black,
          hint: Colors.grey,
        ),
        error: const AppTextFieldStateStyle(
          border: Colors.red,
          background: Colors.white,
          text: Colors.black,
          hint: Colors.red,
        ),
        disabled: const AppTextFieldStateStyle(
          border: Color(0xFFDDDDDD),
          background: Color(0xFFF5F5F5),
          text: Colors.grey,
          hint: Colors.grey,
        ),
      ),

      outlined: AppTextFieldStyle(
        enabled: const AppTextFieldStateStyle(
          border: Color(0xFFE0E0E0),
          background: Colors.transparent,
          text: Colors.black,
          hint: Colors.grey,
        ),
        focused: const AppTextFieldStateStyle(
          border: Color(0xFF0066FF),
          background: Colors.transparent,
          text: Colors.black,
          hint: Colors.grey,
        ),
        error: const AppTextFieldStateStyle(
          border: Colors.red,
          background: Colors.transparent,
          text: Colors.black,
          hint: Colors.red,
        ),
        disabled: const AppTextFieldStateStyle(
          border: Color(0xFFDDDDDD),
          background: Colors.transparent,
          text: Colors.grey,
          hint: Colors.grey,
        ),
      ),

      underlined: AppTextFieldStyle(
        enabled: const AppTextFieldStateStyle(
          border: Color(0xFFE0E0E0),
          background: Colors.transparent,
          text: Colors.black,
          hint: Colors.grey,
        ),
        focused: const AppTextFieldStateStyle(
          border: Color(0xFF0066FF),
          background: Colors.transparent,
          text: Colors.black,
          hint: Colors.grey,
        ),
        error: const AppTextFieldStateStyle(
          border: Colors.red,
          background: Colors.transparent,
          text: Colors.black,
          hint: Colors.red,
        ),
        disabled: const AppTextFieldStateStyle(
          border: Color(0xFFDDDDDD),
          background: Colors.transparent,
          text: Colors.grey,
          hint: Colors.grey,
        ),
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      radius: BorderRadius.circular(12),
    );
  }

  @override
  ThemeExtension<AppTextFieldThemeExtension> lerp(
      ThemeExtension<AppTextFieldThemeExtension>? other,
      double t,
      ) {
    if (other is! AppTextFieldThemeExtension) return this;

    return AppTextFieldThemeExtension(
      filled: filled.lerp(other.filled, t),
      outlined: outlined.lerp(other.outlined, t),
      underlined: underlined.lerp(other.underlined, t),
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      radius: BorderRadius.lerp(radius, other.radius, t)!,
    );
  }

  @override
  AppTextFieldThemeExtension copyWith({
    AppTextFieldStyle? filled,
    AppTextFieldStyle? outlined,
    AppTextFieldStyle? underlined,
    EdgeInsets? padding,
    BorderRadius? radius,
  }) {
    return AppTextFieldThemeExtension(
      filled: filled ?? this.filled,
      outlined: outlined ?? this.outlined,
      underlined: underlined ?? this.underlined,
      padding: padding ?? this.padding,
      radius: radius ?? this.radius,
    );
  }
}

// final class AppTextFieldThemeExtension
//     extends ThemeExtension<AppTextFieldThemeExtension> {
//
//   factory AppTextFieldThemeExtension.light() {
//     return AppTextFieldThemeExtension(
//       filled: AppTextFieldStyle(
//         background: AppColors.white,
//         border: Color(0xFFE0E0E0),
//         focusedBorder: Color(0xFF0066FF),
//       ),
//       outlined: const AppTextFieldStyle(
//         background: Colors.transparent,
//         border: Color(0xFFE0E0E0),
//         focusedBorder: Color(0xFF0066FF),
//       ),
//       underlined: const AppTextFieldStyle(
//         background: Colors.transparent,
//         border: Color(0xFFE0E0E0),
//         focusedBorder: Color(0xFF0066FF),
//       ),
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 14,
//       ),
//       radius: BorderRadius.circular(12),
//     );
//   }
//
//   factory AppTextFieldThemeExtension.dark() {
//     return AppTextFieldThemeExtension(
//       filled: const AppTextFieldStyle(
//         background: Color(0xFF1E1E1E),
//         border: Color(0xFF3A3A3A),
//         focusedBorder: Colors.blue,
//       ),
//       outlined: const AppTextFieldStyle(
//         background: Colors.transparent,
//         border: Color(0xFF3A3A3A),
//         focusedBorder: Colors.blue,
//       ),
//       underlined: const AppTextFieldStyle(
//         background: Colors.transparent,
//         border: Color(0xFF3A3A3A),
//         focusedBorder: Colors.blue,
//       ),
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 14,
//       ),
//       radius: BorderRadius.circular(12),
//     );
//   }
//
//   final AppTextFieldStyle filled;
//   final AppTextFieldStyle outlined;
//   final AppTextFieldStyle underlined;
//
//   final EdgeInsets padding;
//   final BorderRadius radius;
//
//   const AppTextFieldThemeExtension({
//     required this.filled,
//     required this.outlined,
//     required this.underlined,
//     required this.padding,
//     required this.radius,
//   });
//
//   @override
//   AppTextFieldThemeExtension copyWith({
//     AppTextFieldStyle? filled,
//     AppTextFieldStyle? outlined,
//     AppTextFieldStyle? underlined,
//     EdgeInsets? padding,
//     BorderRadius? radius,
//   }) {
//     return AppTextFieldThemeExtension(
//       filled: filled ?? this.filled,
//       outlined: outlined ?? this.outlined,
//       underlined: underlined ?? this.underlined,
//       padding: padding ?? this.padding,
//       radius: radius ?? this.radius,
//     );
//   }
//
//   @override
//   ThemeExtension<AppTextFieldThemeExtension> lerp(
//       ThemeExtension<AppTextFieldThemeExtension>? other,
//       double t,
//       ) {
//     if (other is! AppTextFieldThemeExtension) return this;
//     return AppTextFieldThemeExtension(
//       filled: AppTextFieldStyle(
//         background: Color.lerp(filled.background, other.filled.background, t)!,
//         border: Color.lerp(filled.border, other.filled.border, t)!,
//         focusedBorder: Color.lerp(filled.focusedBorder, other.filled.focusedBorder, t)!,
//       ),
//       outlined: AppTextFieldStyle(
//         background: Color.lerp(outlined.background, other.outlined.background, t)!,
//         border: Color.lerp(outlined.border, other.outlined.border, t)!,
//         focusedBorder: Color.lerp(outlined.focusedBorder, other.outlined.focusedBorder, t)!,
//       ),
//       underlined: AppTextFieldStyle(
//         background: Color.lerp(underlined.background, other.underlined.background, t)!,
//         border: Color.lerp(underlined.border, other.underlined.border, t)!,
//         focusedBorder: Color.lerp(underlined.focusedBorder, other.underlined.focusedBorder, t)!,
//       ),
//       padding: EdgeInsets.lerp(padding, other.padding, t)!,
//       radius: BorderRadius.lerp(radius, other.radius, t)!,
//     );
//   }
// }