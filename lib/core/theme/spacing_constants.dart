import 'package:flutter/material.dart';

// Raw predefined spacing values
class Spacing {
  Spacing._();

  static const double small1 = 5;
  static const double small2 = 10;
  static const double small3 = 15;
  static const double small4 = 20;
  static const double m = 30;
  static const double l = 40;
  static const double xl = 50;

  static const double pagePadding = small3;
}

class SpacingValues {
  static final small1 = SpacingValue(Spacing.small1);
  static final small2 = SpacingValue(Spacing.small2);
  static final small3 = SpacingValue(Spacing.small3);
  static final small4 = SpacingValue(Spacing.small4);
  static final m = SpacingValue(Spacing.m);
  static final l = SpacingValue(Spacing.l);
  static final xl = SpacingValue(Spacing.xl);

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
