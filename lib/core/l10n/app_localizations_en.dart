// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome';

  @override
  String get welcomeTitle => 'Find Your Perfect Campsite';

  @override
  String get welcomeSubtitle =>
      'Discover unique camping spots from local hosts and create unforgettable outdoor experiences.';

  @override
  String get discoverCampsitesTitle => 'Discover Campsites';

  @override
  String get discoverCampsitesSubtitle =>
      'Browse through hundreds of unique camping locations';

  @override
  String get filterAndSearchTitle => 'Filter & Search';

  @override
  String get filterAndSearchSubtitle =>
      'Find the perfect spot with advanced filtering options';

  @override
  String get mapViewTitle => 'Map View';

  @override
  String get mapViewSubtitle => 'Explore camping spots on an interactive map';

  @override
  String get getStarted => 'Start Exploring';
}
