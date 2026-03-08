import 'package:designsystem/designsystem.dart';

class AppTextFieldStyle {

  final AppTextFieldStateStyle enabled;
  final AppTextFieldStateStyle focused;
  final AppTextFieldStateStyle error;
  final AppTextFieldStateStyle disabled;

  const AppTextFieldStyle({
    required this.enabled,
    required this.focused,
    required this.error,
    required this.disabled,
  });

  AppTextFieldStyle lerp(
      AppTextFieldStyle other,
      double t,
      ) {
    return AppTextFieldStyle(
      enabled: enabled.lerp(other.enabled, t),
      focused: focused.lerp(other.focused, t),
      error: error.lerp(other.error, t),
      disabled: disabled.lerp(other.disabled, t),
    );
  }
}

//
// class AppTextFieldStyle {
//
//   final Color background;
//   final Color border;
//   final Color focusedBorder;
//
//   const AppTextFieldStyle({
//     required this.background,
//     required this.border,
//     required this.focusedBorder,
//   });
//
//   AppTextFieldStyle lerp(AppTextFieldStyle other, double t) {
//     return AppTextFieldStyle(
//       background: Color.lerp(background, other.background, t)!,
//       border: Color.lerp(border, other.border, t)!,
//       focusedBorder: Color.lerp(focusedBorder, other.focusedBorder, t)!,
//     );
//   }
// }