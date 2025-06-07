import 'package:flutter/material.dart';
import 'package:spot_a_camp/core/barrel.dart';

extension BuildContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
