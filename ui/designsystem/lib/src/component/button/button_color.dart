import 'package:flutter/material.dart';

final class ButtonColor{
  final Color background;
  final Color disableBackground;
  final Color border;
  final Color disableBorder;
  final Color foreground;
  final Color disableForeground;
  final Color? iconColor;

  Color get effectiveIconColor => iconColor ?? foreground;


  const ButtonColor._({
    required this.background,
    required this.disableBackground,
    required this.border,
    required this.disableBorder,
    required this.foreground,
    required this.disableForeground,
    this.iconColor,
  });

  factory ButtonColor.filled({
    required Color background,
    Color? disableBackground,
    required Color foreground,
    Color? disableForeground,
    Color? iconColor,
  }){
    return ButtonColor._(
      background: background,
      disableBackground: disableBackground ?? background,
      border: Colors.transparent,
      disableBorder: Colors.transparent,
      foreground: foreground,
      disableForeground: disableForeground ?? foreground,
      iconColor: iconColor,
    );
  }

  factory ButtonColor.outline({
    required Color border,
    Color? disableBorder,
    required Color foreground,
    Color? disableForeground,
    Color? iconColor,
  }){
    return ButtonColor._(
        background: Colors.transparent,
        disableBackground: Colors.transparent,
        border: border,
        disableBorder: disableBorder ?? border,
        foreground: foreground,
        disableForeground: disableForeground ?? foreground,
        iconColor: iconColor,
    );
  }

  factory ButtonColor.textAndIconOnly({
    required Color foreground,
    Color? disableForeground,
    Color? iconColor,
  }){
    return ButtonColor._(
        background: Colors.transparent,
        disableBackground: Colors.transparent,
        border: Colors.transparent,
        disableBorder: Colors.transparent,
        foreground: foreground,
        disableForeground: disableForeground ?? foreground,
        iconColor: iconColor,
    );
  }


  factory ButtonColor.filledWithOutline({
    required Color background,
    Color? disableBackground,
    required Color border,
    Color? disableBorder,
    required Color foreground,
    Color? disableForeground,
    Color? iconColor,
  }){
    return ButtonColor._(
        background: background,
        disableBackground: disableBackground ?? background,
        border: border,
        disableBorder: disableBorder ?? border,
        foreground: foreground,
        disableForeground: disableForeground ?? foreground,
        iconColor: iconColor,
    );
  }
}