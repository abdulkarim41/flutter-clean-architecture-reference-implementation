import 'package:flutter/material.dart';

sealed class AppTextWeight{
  const AppTextWeight();
  const factory AppTextWeight.regular() = RegularFontWeight;
  const factory AppTextWeight.medium() = MediumFontWeight;
  const factory AppTextWeight.semibold() = SemiboldFontWeight;
  const factory AppTextWeight.bold() = BoldFontWeight;

  FontWeight get value;
}

class RegularFontWeight extends AppTextWeight {
  const RegularFontWeight();
  @override FontWeight get value => FontWeight.w400;
}

class MediumFontWeight extends AppTextWeight {
  const MediumFontWeight();
  @override FontWeight get value => FontWeight.w500;
}

class SemiboldFontWeight extends AppTextWeight {
  const SemiboldFontWeight();
  @override FontWeight get value => FontWeight.w600;
}

class BoldFontWeight extends AppTextWeight {
  const BoldFontWeight();
  @override FontWeight get value => FontWeight.w700;
}
