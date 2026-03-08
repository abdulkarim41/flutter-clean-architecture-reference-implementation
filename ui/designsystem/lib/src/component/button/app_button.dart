import 'package:flutter/material.dart';
import 'package:designsystem/designsystem.dart';

class AppButton extends StatelessWidget {

  final AppButtonVariant variant;
  final AppButtonRole role;
  final String? label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool loading;

  const AppButton._({
    super.key,
    required this.variant,
    required this.role,
    this.label,
    this.icon,
    this.onPressed,
    this.loading = false,
  });

  /// Filled Button
  factory AppButton.filled({
    required AppButtonRole role,
    required String label,
    required VoidCallback? onPressed,
    bool loading = false,
    Key? key
  }) {
    return AppButton._(
      key: key,
      variant: AppButtonVariant.filled,
      role: role,
      label: label,
      onPressed: onPressed,
      loading: loading,
    );
  }

  /// Outline Button
  factory AppButton.outline({
    required AppButtonRole role,
    required String label,
    required VoidCallback? onPressed,
    bool loading = false,
    Key? key
  }) {
    return AppButton._(
      key: key,
      variant: AppButtonVariant.outline,
      role: role,
      label: label,
      onPressed: onPressed,
      loading: loading,
    );
  }

  /// Text Button
  factory AppButton.text({
    required AppButtonRole role,
    required String label,
    required VoidCallback? onPressed,
    bool loading = false,
    Key? key
  }) {
    return AppButton._(
      key: key,
      variant: AppButtonVariant.text,
      role: role,
      label: label,
      onPressed: onPressed,
      loading: loading,
    );
  }

  /// Icon Button
  factory AppButton.icon({
    required AppButtonRole role,
    required IconData icon,
    required VoidCallback? onPressed,
    bool loading = false,
    Key? key
  }) {
    return AppButton._(
      key: key,
      variant: AppButtonVariant.icon,
      role: role,
      icon: icon,
      onPressed: onPressed,
      loading: loading,
    );
  }

  @override
  Widget build(BuildContext context) {

    final theme = context.buttonTheme;
    final colors = _resolveRole(theme, role);

    final disabled = loading || onPressed == null;

    switch (variant) {

      case AppButtonVariant.filled:
        return ElevatedButton(
          onPressed: disabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.background,
            foregroundColor: colors.foreground,
            padding: theme.padding,
            shape: RoundedRectangleBorder(
              borderRadius: theme.radius,
            ),
          ),
          child: _buildChild(colors),
        );

      case AppButtonVariant.outline:
        return OutlinedButton(
          onPressed: disabled ? null : onPressed,
          style: OutlinedButton.styleFrom(
            padding: theme.padding,
            side: BorderSide(color: colors.border),
            shape: RoundedRectangleBorder(
              borderRadius: theme.radius,
            ),
          ),
          child: _buildChild(colors),
        );

      case AppButtonVariant.text:
        return TextButton(
          onPressed: disabled ? null : onPressed,
          child: _buildChild(colors),
        );

      case AppButtonVariant.icon:
        return IconButton(
          onPressed: disabled ? null : onPressed,
          icon: loading
              ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: colors.foreground,
            ),
          )
              : Icon(icon, color: colors.foreground),
        );
    }
  }

  Widget _buildChild(AppButtonColor colors) {

    if (loading) {
      return SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: colors.foreground,
        ),
      );
    }

    return Text(label ?? "");
  }

  AppButtonColor _resolveRole(
      AppButtonThemeExtension theme,
      AppButtonRole role,
      ) {

    switch (role) {
      case AppButtonRole.primary:
        return theme.primary;

      case AppButtonRole.secondary:
        return theme.secondary;

      case AppButtonRole.tertiary:
        return theme.tertiary;
    }
  }
}