import 'package:flutter/material.dart';

// Raw predefined spacing values
class Spacing {
  Spacing._();

  static const double xxs = 2;
  static const double xs = 4;
  static const double small1 = 8;
  static const double small2 = 12;
  static const double small3 = 16;
  static const double small4 = 24;
  static const double m = 32;
  static const double l = 48;

  static const double pagePadding = small3;
}

class SpacingValues {
  static final small1 = SpacingValue(Spacing.small1);
  static final small2 = SpacingValue(Spacing.small2);
  static final small3 = SpacingValue(Spacing.small3);
  static final small4 = SpacingValue(Spacing.small4);
  static final m = SpacingValue(Spacing.m);
  static final l = SpacingValue(Spacing.l);

  static final pagePadding = SpacingValue(Spacing.pagePadding);
}

class SpacingValue {
  final double value;

  // all sides
  final EdgeInsets all;

  // single side
  final EdgeInsets top;
  final EdgeInsets bottom;
  final EdgeInsets left;
  final EdgeInsets right;

  // symmetric
  final EdgeInsets vertical;
  final EdgeInsets horizontal;

  SpacingValue(this.value)
    : all = EdgeInsets.all(value),
      top = EdgeInsets.only(top: value),
      bottom = EdgeInsets.only(bottom: value),
      left = EdgeInsets.only(left: value),
      right = EdgeInsets.only(right: value),
      vertical = EdgeInsets.symmetric(vertical: value),
      horizontal = EdgeInsets.symmetric(horizontal: value);
}
