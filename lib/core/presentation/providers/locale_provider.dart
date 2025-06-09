import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spot_a_camp/core/barrel.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('en')) {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    try {
      final box = await Hive.openBox(HiveKeys.prefsBox);
      final savedLocale =
          box.get(HiveKeys.locale, defaultValue: 'en') as String;
      state = Locale(savedLocale);
    } catch (e) {
      // If there's an error, keep the default locale
      state = const Locale('en');
    }
  }

  Future<void> setLocale(Locale locale) async {
    try {
      final box = await Hive.openBox(HiveKeys.prefsBox);
      await box.put(HiveKeys.locale, locale.languageCode);
      state = locale;
    } catch (e) {
      // If there's an error saving, still update the state for this session
      state = locale;
    }
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});
