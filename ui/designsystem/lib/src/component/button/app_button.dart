import 'package:flutter/material.dart';
import 'package:designsystem/designsystem.dart';
import 'package:flutter_svg/svg.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final ButtonVariant variant;
  final String? label;
  final VoidCallback? onPressed;
  final bool loading;
  final double? width;
  final double? height;
  final ButtonColorRole colorRole;
  final ButtonShape shape;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final bool isLoading;
  final BorderRadiusGeometry? borderRadius;
  final Widget? leading;
  final Widget? trailing;

  const AppButton._({
    super.key,
    required this.variant,
    required this.colorRole,
    required this.shape,
    required this.child,
    this.label,
    this.onPressed,
    this.loading = false,
    this.width,
    this.height,
    this.padding,
    this.textStyle,
    this.isLoading = false,
    this.borderRadius,
    this.leading,
    this.trailing,
  });

  /// Filled Button
  factory AppButton.filled({
    required Widget child,
    required ButtonColorRole colorRole,
    required VoidCallback? onPressed,
    ButtonShape shape = ButtonShape.rounded,
    bool loading = false,
    Key? key,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
    bool? isLoading,
    BorderRadiusGeometry? borderRadius,
    Widget? leading,
    Widget? trailing,
  }) {
    return AppButton._(
      key: key,
      variant: ButtonVariant.filled,
      colorRole: colorRole,
      shape: shape,
      padding: padding ?? EdgeInsets.zero,
      onPressed: onPressed,
      loading: loading,
      height: height,
      width: width,
      textStyle: textStyle,
      isLoading: isLoading ?? false,
      borderRadius: borderRadius,
      leading: leading,
      trailing: trailing,
      child: child,
    );
  }

  /// Outline Button
  factory AppButton.outline({
    required Widget child,
    required ButtonColorRole colorRole,
    required String label,
    EdgeInsetsGeometry? padding,
    required VoidCallback? onPressed,
    ButtonShape shape = ButtonShape.rounded,
    bool loading = false,
    Key? key,
    double? width,
    double? height,
    TextStyle? textStyle,
    bool? isLoading,
    BorderRadiusGeometry? borderRadius,
    Widget? leading,
    Widget? trailing,
  }) {
    return AppButton._(
      key: key,
      variant: ButtonVariant.outline,
      padding: padding ?? EdgeInsets.zero,
      shape: shape,
      colorRole: colorRole,
      label: label,
      onPressed: onPressed,
      loading: loading,
      height: height,
      width: width,
      textStyle: textStyle,
      isLoading: isLoading ?? false,
      borderRadius: borderRadius,
      leading: leading,
      trailing: trailing,
      child: child,
    );
  }

  /// Text Button
  factory AppButton.text({
    required Widget text,
    required ButtonColorRole colorRole,
    required VoidCallback? onPressed,
    EdgeInsetsGeometry? padding,
    bool loading = false,
    Key? key,
    double? width,
    double? height,
    TextStyle? textStyle,
    Widget? leading,
    Widget? trailing,
  }) {
    assert(text is Text, "Only Text is allowed");
    return AppButton._(
      key: key,
      variant: ButtonVariant.text,
      shape: ButtonShape.pill,
      colorRole: colorRole,
      padding: padding ?? EdgeInsets.zero,
      onPressed: onPressed,
      loading: loading,
      height: height,
      width: width,
      textStyle: textStyle,
      leading: leading,
      trailing: trailing,
      child: text,
    );
  }

  /// Icon Button
  factory AppButton.icon({
    required Widget icon,
    required ButtonColorRole colorRole,
    required VoidCallback? onPressed,
    EdgeInsetsGeometry? padding,
    bool loading = false,
    Key? key,
    double? width,
    double? height,
  }) {
    assert(
    icon is Icon || icon is SvgPicture,
    "Only IconData or SvgPicture is allowed"
    );
    return AppButton._(
      key: key,
      variant: ButtonVariant.icon,
      shape: ButtonShape.pill,
      colorRole: colorRole,
      padding: padding ?? EdgeInsets.zero,
      onPressed: onPressed,
      loading: loading,
      height: height,
      width: width,
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {

    final buttonColor = _resolveButtonColors(context.buttonTheme);

    final buttonStyle = ButtonStyle(
      elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.resolveWith(
            (state) => _resolveButtonShape(buttonColor.border),
      ),
      backgroundColor: _resolveBackgroundColor(buttonColor),
      foregroundColor: _resolveForegroundColor(buttonColor),
      overlayColor: _resolveOverly(buttonColor.foreground),
      minimumSize: WidgetStateProperty.all(
        Size(width ?? 0, height ?? ButtonSizing.height(ButtonSize.lg)),
      ),
      padding: WidgetStateProperty.all(padding),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textStyle: WidgetStateProperty.all(
        context.appTypography.bodyMedium.regular.merge(textStyle),
      ),
    );

    return ElevatedButton(
      onPressed: onPressed == null
          ? null
          : () {
        if (!isLoading) onPressed?.call();
      },
      style: buttonStyle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          if (isLoading) ..._buildLoadingWidgets(buttonColor),
          if (!isLoading) ..._buildContentWidgets(buttonColor),
        ],
      ),
    );
  }

  ButtonColor _resolveButtonColors(AppButtonThemeExtension colorTheme) {
    return switch (colorRole) {
      ButtonColorBrand() => _resolveVariantsWiseColor(colorTheme.primary),
      ButtonColorSecondary() => _resolveVariantsWiseColor(colorTheme.secondary),
      ButtonColorCustom(color: final color) => color,
    };
  }

  OutlinedBorder _resolveButtonShape(Color borderColor) {
    final borderSide = BorderSide(color: borderColor);
    return switch (shape) {
      ButtonShape.rectangle => RoundedRectangleBorder(side: borderSide),
      ButtonShape.rounded => RoundedRectangleBorder(
        side: borderSide,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      ButtonShape.pill => StadiumBorder(side: borderSide),
      ButtonShape.circle => CircleBorder(side: borderSide),
    };
  }

  WidgetStateProperty<Color?>? _resolveBackgroundColor(ButtonColor color) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return color.disableBackground;
      }

      return color.background;
    });
  }

  WidgetStateProperty<Color?>? _resolveForegroundColor(ButtonColor color) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return color.disableForeground;
      }

      return color.foreground;
    });
  }

  WidgetStateProperty<Color?>? _resolveOverly(Color overlayColor) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return overlayColor.withValues(alpha: 0.2);
      }
      return null;
    });
  }

  ButtonColor _resolveVariantsWiseColor(ButtonColorSet colorSet) {
    return switch (variant) {
      ButtonVariant.filled => colorSet.filled ?? _throw(colorSet),
      ButtonVariant.outline => colorSet.outline ?? _throw(colorSet),
      ButtonVariant.text => colorSet.textAndIconOnly ?? _throw(colorSet),
      ButtonVariant.icon => colorSet.textAndIconOnly ?? _throw(colorSet),
    };
  }

  List<Widget> _buildLoadingWidgets(ButtonColor buttonColor) {
    return [
      SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          color: buttonColor.foreground,
          strokeWidth: 3,
        ),
      ),
      Text("processing...", style: TextStyle(color: buttonColor.foreground)),
    ];
  }

  List<Widget> _buildContentWidgets(ButtonColor buttonColor) {
    return [
      if (leading != null) ...[
        _resolveContentWidget(leading!, buttonColor.effectiveIconColor),
      ],
      Flexible(
        child: _resolveContentWidget(child, buttonColor.effectiveIconColor),
      ),
      if (trailing != null) ...[
        _resolveContentWidget(trailing!, buttonColor.effectiveIconColor),
      ],
    ];
  }


  Widget _resolveContentWidget(Widget widget, Color color) {
    if (widget is Icon) {
      return Icon(widget.icon, color: color, size: widget.size);
    } else if (widget is SvgPicture) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        child: widget,
      );
    }
    return widget;
  }

  static Never _throw(Object? object) => throw UnimplementedError(
    "${object.toString()} not provided yet, but access",
  );

}