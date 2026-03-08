import 'package:flutter/material.dart';
import 'package:designsystem/designsystem.dart';

class AppTextField extends StatelessWidget {

  final TextEditingController? controller;
  final String? hint;
  final bool obscureText;
  final bool enabled;

  final AppTextFieldVariant variant;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final String? Function(String?)? validator;

  const AppTextField._({
    super.key,
    this.controller,
    this.hint,
    this.obscureText = false,
    this.enabled = true,
    required this.variant,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  factory AppTextField.filled({
    Key? key,
    TextEditingController? controller,
    String? hint,
    bool obscureText = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return AppTextField._(
      key: key,
      controller: controller,
      hint: hint,
      obscureText: obscureText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      variant: AppTextFieldVariant.filled,
    );
  }

  factory AppTextField.outlined({
    Key? key,
    TextEditingController? controller,
    String? hint,
    bool obscureText = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return AppTextField._(
      key: key,
      controller: controller,
      hint: hint,
      obscureText: obscureText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      variant: AppTextFieldVariant.outlined,
    );
  }

  factory AppTextField.underlined({
    Key? key,
    TextEditingController? controller,
    String? hint,
    bool obscureText = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return AppTextField._(
      key: key,
      controller: controller,
      hint: hint,
      obscureText: obscureText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      variant: AppTextFieldVariant.underlined,
    );
  }

  @override
  Widget build(BuildContext context) {

    final theme = context.textFieldTheme;
    final style = _style(theme);

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      validator: validator,
      style: TextStyle(color: style.enabled.text),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: style.enabled.hint),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: variant == AppTextFieldVariant.filled,
        fillColor: style.enabled.background,
        contentPadding: theme.padding,
        border: _border(theme, style.enabled.border),
        enabledBorder: _border(theme, style.enabled.border),
        focusedBorder: _border(theme, style.focused.border),
        errorBorder: _border(theme, style.error.border),
        disabledBorder: _border(theme, style.disabled.border),
      ),
    );
  }

  AppTextFieldStyle _style(AppTextFieldThemeExtension theme) {
    return switch (variant) {
      AppTextFieldVariant.filled => theme.filled,
      AppTextFieldVariant.outlined => theme.outlined,
      AppTextFieldVariant.underlined => theme.underlined,
    };
  }

  InputBorder _border(
      AppTextFieldThemeExtension theme,
      Color color,
      ) {
    return switch (variant) {

      AppTextFieldVariant.filled ||
      AppTextFieldVariant.outlined =>
          OutlineInputBorder(
            borderRadius: theme.radius,
            borderSide: BorderSide(color: color),
          ),

      AppTextFieldVariant.underlined =>
          UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
    };
  }
}

// class AppTextField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String? hint;
//   final bool obscureText;
//   final AppTextFieldVariant variant;
//
//   const AppTextField._({
//     this.controller,
//     this.hint,
//     required this.variant,
//     this.obscureText = false,
//     super.key,
//   });
//
//   factory AppTextField.filled({
//     TextEditingController? controller,
//     String? hint,
//     bool obscureText = false,
//     Key? key
//   }) {
//     return AppTextField._(
//         key: key,
//         controller: controller,
//         hint: hint,
//         obscureText: obscureText,
//         variant: AppTextFieldVariant.filled
//     );
//   }
//
//   factory AppTextField.outlined({
//     TextEditingController? controller,
//     String? hint,
//     bool obscureText = false,
//     Key? key
//   }) {
//     return AppTextField._(
//         key: key,
//         controller: controller,
//         hint: hint,
//         obscureText: obscureText,
//         variant: AppTextFieldVariant.outlined
//     );
//   }
//
//   factory AppTextField.underlined({
//     TextEditingController? controller,
//     String? hint,
//     bool obscureText = false,
//     Key? key
//   }) {
//     return AppTextField._(
//         key: key,
//         controller: controller,
//         hint: hint,
//         obscureText: obscureText,
//         variant: AppTextFieldVariant.underlined
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = context.textFieldTheme;
//
//     final style = _getStyle(theme);
//
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         hintText: hint,
//         filled: variant == AppTextFieldVariant.filled,
//         fillColor: style.background,
//         contentPadding: theme.padding,
//         border: _getBorder(theme, style),
//         enabledBorder: _getBorder(theme, style),
//         focusedBorder: _getFocusedBorder(theme, style),
//       ),
//     );
//   }
//
//   AppTextFieldStyle _getStyle(AppTextFieldThemeExtension theme) {
//     switch (variant) {
//       case AppTextFieldVariant.filled:
//         return theme.filled;
//       case AppTextFieldVariant.outlined:
//         return theme.outlined;
//       case AppTextFieldVariant.underlined:
//         return theme.underlined;
//     }
//   }
//
//   InputBorder _getBorder(AppTextFieldThemeExtension theme, AppTextFieldStyle style) {
//     switch (variant) {
//       case AppTextFieldVariant.filled:
//         return OutlineInputBorder(borderRadius: theme.radius, borderSide: BorderSide.none);
//       case AppTextFieldVariant.outlined:
//         return OutlineInputBorder(borderRadius: theme.radius, borderSide: BorderSide(color: style.border));
//       case AppTextFieldVariant.underlined:
//         return UnderlineInputBorder(borderSide: BorderSide(color: style.border));
//     }
//   }
//
//   InputBorder _getFocusedBorder(AppTextFieldThemeExtension theme, AppTextFieldStyle style) {
//     switch (variant) {
//       case AppTextFieldVariant.filled:
//       case AppTextFieldVariant.outlined:
//         return OutlineInputBorder(borderRadius: theme.radius, borderSide: BorderSide(color: style.focusedBorder));
//       case AppTextFieldVariant.underlined:
//         return UnderlineInputBorder(borderSide: BorderSide(color: style.focusedBorder));
//     }
//   }
// }
