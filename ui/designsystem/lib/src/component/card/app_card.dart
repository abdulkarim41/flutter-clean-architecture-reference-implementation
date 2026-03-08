import 'package:flutter/material.dart';
import 'package:designsystem/designsystem.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final AppCardVariant variant;

  const AppCard._({
    required this.child,
    required this.variant,
    this.onTap,
    super.key,
  });

  factory AppCard.filled({
    required Widget child,
    VoidCallback? onTap,
    Key? key
  }) {
    return AppCard._(
        key: key,
        onTap: onTap,
        variant: AppCardVariant.filled,
        child: child
    );
  }

  factory AppCard.outlined({
    required Widget child,
    VoidCallback? onTap,
    Key? key
  }) {
    return AppCard._(
        key: key,
        onTap: onTap,
        variant: AppCardVariant.outlined,
        child: child
    );
  }

  factory AppCard.elevated({
    required Widget child,
    VoidCallback? onTap,
    Key? key
  }) {
    return AppCard._(
        key: key,
        onTap: onTap,
        variant: AppCardVariant.elevated,
        child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.cardTheme;
    final AppCardStyle style;
    switch (variant) {
      case AppCardVariant.filled:
        style = theme.filled;
        break;
      case AppCardVariant.outlined:
        style = theme.outlined;
        break;
      case AppCardVariant.elevated:
        style = theme.elevated;
        break;
    }

    return Material(
      color: style.background,
      elevation: style.elevation,
      borderRadius: theme.radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: theme.radius,
        child: Container(
          padding: theme.padding,
          decoration: BoxDecoration(
            borderRadius: theme.radius,
            border: variant == AppCardVariant.outlined ? Border.all(color: style.border) : null,
          ),
          child: child,
        ),
      ),
    );
  }
}