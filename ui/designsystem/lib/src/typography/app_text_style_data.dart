import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

@immutable
class AppTextStyleData {
  final TextStyle regular;
  final TextStyle medium;
  final TextStyle semibold;
  final TextStyle bold;

  const AppTextStyleData({
    required this.regular,
    required this.medium,
    required this.semibold,
    required this.bold,
  });

  TextStyle getStyle(AppTextWeight weight) {
    return switch (weight) {
      RegularFontWeight() => regular,
      MediumFontWeight() => medium,
      SemiboldFontWeight() => semibold,
      BoldFontWeight() => bold,
    };
  }
}
