import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

import 'foundation_token.dart';

abstract class AppSpacing {

  static const Map<SpaceToken, double> _base = {
    SpaceToken.zero: 0,
    SpaceToken.xxs : 2,
    SpaceToken.xs  : 4,
    SpaceToken.sm  : 8,
    SpaceToken.md  : 12,
    SpaceToken.lg  : 16,
    SpaceToken.xl  : 24,
    SpaceToken.xxl : 32,
    SpaceToken.xxxl: 48,
  };

  static double value(SpaceToken t) => _base[t]!;
  static double valueWidth(SpaceToken t) => _base[t]!;
  static double valueHeight(SpaceToken t) => _base[t]!;


  static EdgeInsetsDirectional all(SpaceToken t) =>
      EdgeInsetsDirectional.all(value(t));

  static EdgeInsetsDirectional horizontal(SpaceToken t) =>
      EdgeInsetsDirectional.symmetric(horizontal: value(t));

  static EdgeInsetsDirectional vertical(SpaceToken t) =>
      EdgeInsetsDirectional.symmetric(vertical: value(t));

  static EdgeInsetsDirectional symmetric({
    required SpaceToken horizontal, 
    required SpaceToken vertical,
  }){
    return EdgeInsetsDirectional.symmetric(
      horizontal: value(horizontal),
      vertical: value(vertical),
    );
  }
      

  static EdgeInsetsDirectional only({
    SpaceToken? start, SpaceToken? top, SpaceToken? end, SpaceToken? bottom,
  }) => EdgeInsetsDirectional.only(
    start : start  == null ? 0 : value(start),
    top   : top    == null ? 0 : value(top),
    end   : end    == null ? 0 : value(end),
    bottom: bottom == null ? 0 : value(bottom),
  );

  // Gaps
  static SizedBox gap(SpaceToken t)  => SizedBox(width: value(t),  height: value(t));
  static SizedBox gapWidth(SpaceToken t) => SizedBox(width: valueWidth(t));
  static SizedBox gapHeight(SpaceToken t) => SizedBox(height: valueHeight(t));
}