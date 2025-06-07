import 'package:flutter/material.dart';
import 'package:spot_a_camp/core/barrel.dart';

class CustomBorderRadius {
  static const BorderRadius small = BorderRadius.all(CustomRadius.small),
      medium = BorderRadius.all(CustomRadius.m),
      large = BorderRadius.all(CustomRadius.large);

  static const BorderRadius input = BorderRadius.all(CustomRadius.input);
}

extension BorderRadiusX on BorderRadius {
  BorderRadius get noBottom =>
      copyWith(bottomLeft: Radius.zero, bottomRight: Radius.zero);
}
