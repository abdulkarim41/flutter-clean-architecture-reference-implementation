import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

abstract class AppRadii {

  static const Map<RadiusToken, double> _base = {
    RadiusToken.none: 0,
    RadiusToken.xs  : 2,
    RadiusToken.sm  : 4,
    RadiusToken.md  : 8,
    RadiusToken.lg  : 12,
    RadiusToken.xl  : 16,
    RadiusToken.capsule: 999,
  };

  /// BorderRadius helpers (use when an API needs BorderRadius / BorderRadiusGeometry)

  static double value(RadiusToken t) =>
      t == RadiusToken.capsule ? 999 : _base[t]!;

  static BorderRadius borderRadius(RadiusToken t) =>
      t == RadiusToken.capsule ? BorderRadius.circular(999) : BorderRadius.circular(value(t));

  static BorderRadius borderRadiusH(RadiusToken t) =>
      BorderRadius.horizontal(left: Radius.circular(value(t)), right: Radius.circular(value(t)));

  static BorderRadius borderRadiusV(RadiusToken t) =>
      BorderRadius.vertical(top: Radius.circular(value(t)), bottom: Radius.circular(value(t)));

  ///(directional; RTL-aware).
  static BorderRadiusDirectional borderRadiusOnly({
    RadiusToken? topStart,
    RadiusToken? topEnd,
    RadiusToken? bottomStart,
    RadiusToken? bottomEnd,
  }){
    return  BorderRadiusDirectional.only(
      topStart: Radius.circular(topStart == null ? 0 : value(topStart)),
      topEnd: Radius.circular(topEnd == null ? 0 : value(topEnd)),
      bottomStart: Radius.circular(bottomStart == null ? 0 : value(bottomStart)),
      bottomEnd: Radius.circular(bottomEnd == null ? 0 : value(bottomEnd)),
    );
  }


  /// Shape helpers (best for buttons/materials: proper ink & clipping)
  static OutlinedBorder shape(RadiusToken t, {BorderSide side = BorderSide.none}) {
    if (t == RadiusToken.capsule) return StadiumBorder(side: side);
    return RoundedRectangleBorder(borderRadius: borderRadius(t), side: side);
  }


  /// BoxDecoration helpers (rounded rect variants)
  static BoxDecoration boxDecoration({
    required RadiusToken radius,
    Color? color,
    Gradient? gradient,
    DecorationImage? image,
    List<BoxShadow>? shadows,
    BoxBorder? border,
    BlendMode? backgroundBlendMode,
  }) {
    return BoxDecoration(
      color: color,
      gradient: gradient,
      image: image,
      boxShadow: shadows,
      border: border,
      backgroundBlendMode: backgroundBlendMode,
      borderRadius: borderRadius(radius),
    );
  }


  /// Per-corner BoxDecoration (directional; RTL-aware).
  static BoxDecoration boxDecorationOnly({
    RadiusToken? topStart,
    RadiusToken? topEnd,
    RadiusToken? bottomStart,
    RadiusToken? bottomEnd,
    Color? color,
    Gradient? gradient,
    DecorationImage? image,
    List<BoxShadow>? shadows,
    BoxBorder? border,
  }) {
    // BoxDecoration.borderRadius accepts BorderRadiusGeometry, so Directional is fine.
    return BoxDecoration(
      color: color,
      gradient: gradient,
      image: image,
      boxShadow: shadows,
      border: border,
      borderRadius: borderRadiusOnly(
        topStart: topStart,
        topEnd: topEnd,
        bottomStart: bottomStart,
        bottomEnd: bottomEnd,
      ),
    );
  }

  /// Capsule (pill) decoration (best via ShapeDecoration + StadiumBorder)
  static Decoration capsule({
    Color? color,
    Gradient? gradient,
    DecorationImage? image,
    List<BoxShadow>? shadows,
    BoxBorder? border, // if uniform, we’ll translate to BorderSide
  }) {
    final side = _sideFromBoxBorder(border);
    return ShapeDecoration(
      color: color,
      gradient: gradient,
      image: image,
      shadows: shadows,
      shape: shape(RadiusToken.capsule, side: side),
    );
  }

  /// Circle helpers
  static CircleBorder circle({BorderSide side = BorderSide.none}) =>
      CircleBorder(side: side);

  static ShapeDecoration shapeDecorationCircle({
    Color? color,
    Gradient? gradient,
    DecorationImage? image,
    List<BoxShadow>? shadows,
    BorderSide side = BorderSide.none,
  }) {
    return ShapeDecoration(
      color: color,
      gradient: gradient,
      image: image,
      shadows: shadows,
      shape: circle(side: side),
    );
  }

  static BoxDecoration boxDecorationCircle({
    Color? color,
    Gradient? gradient,
    DecorationImage? image,
    List<BoxShadow>? shadows,
    BoxBorder? border, // must be uniform to look correct
  }) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      gradient: gradient,
      image: image,
      boxShadow: shadows,
      border: border,
    );
  }

  // ---- Internals ----
  static BorderSide _sideFromBoxBorder(BoxBorder? border) {
    if (border == null) return BorderSide.none;
    if (border.isUniform) return border.top;
    return border.top;
  }
}