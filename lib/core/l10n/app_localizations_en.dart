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

  @override
  String get browseCampsites => 'Browse Campsites';

  @override
  String get searchCampsites => 'Search campsites...';

  @override
  String get filterCampsites => 'Filter Campsites';

  @override
  String get closeToWater => 'Close to Water';

  @override
  String get campFireAllowed => 'Campfire Allowed';

  @override
  String get pricePerNight => 'Price per Night';

  @override
  String get hostLanguages => 'Host Languages';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get noResults => 'No campsites found';

  @override
  String get euros => '€';

  @override
  String get en => 'English';

  @override
  String get de => 'German';

  @override
  String get listSeparator => ', ';

  @override
  String get filters => 'Filters';

  @override
  String get applyFilters => 'Apply';

  @override
  String get clearFilters => 'Clear Filters';

  @override
  String get priceRange => 'Price Range';

  @override
  String get minPrice => 'Min Price';

  @override
  String get maxPrice => 'Max Price';

  @override
  String get closeToWaterDescription => 'Only show campsites near water';

  @override
  String get campFireAllowedDescription =>
      'Only show campsites that allow campfires';

  @override
  String get invalidPriceRange =>
      'Max price must be greater than or equal to min price';
}
