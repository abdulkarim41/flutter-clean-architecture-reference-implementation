import 'package:flutter/material.dart';

class AppTextFieldStateStyle {

  final Color border;
  final Color background;
  final Color text;
  final Color hint;

  const AppTextFieldStateStyle({
    required this.border,
    required this.background,
    required this.text,
    required this.hint,
  });

  AppTextFieldStateStyle lerp(
      AppTextFieldStateStyle other,
      double t,
      ) {
    return AppTextFieldStateStyle(
      border: Color.lerp(border, other.border, t)!,
      background: Color.lerp(background, other.background, t)!,
      text: Color.lerp(text, other.text, t)!,
      hint: Color.lerp(hint, other.hint, t)!,
    );
  }
}