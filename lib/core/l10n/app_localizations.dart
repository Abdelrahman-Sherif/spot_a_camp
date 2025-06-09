import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Find Your Perfect Campsite'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Discover unique camping spots from local hosts and create unforgettable outdoor experiences.'**
  String get welcomeSubtitle;

  /// No description provided for @discoverCampsitesTitle.
  ///
  /// In en, this message translates to:
  /// **'Discover Campsites'**
  String get discoverCampsitesTitle;

  /// No description provided for @discoverCampsitesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Browse through hundreds of unique camping locations'**
  String get discoverCampsitesSubtitle;

  /// No description provided for @filterAndSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter & Search'**
  String get filterAndSearchTitle;

  /// No description provided for @filterAndSearchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the perfect spot with advanced filtering options'**
  String get filterAndSearchSubtitle;

  /// No description provided for @mapViewTitle.
  ///
  /// In en, this message translates to:
  /// **'Map View'**
  String get mapViewTitle;

  /// No description provided for @mapViewSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Explore camping spots on an interactive map'**
  String get mapViewSubtitle;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Start Exploring'**
  String get getStarted;

  /// No description provided for @browseCampsites.
  ///
  /// In en, this message translates to:
  /// **'Browse Campsites'**
  String get browseCampsites;

  /// No description provided for @searchCampsites.
  ///
  /// In en, this message translates to:
  /// **'Search campsites...'**
  String get searchCampsites;

  /// No description provided for @filterCampsites.
  ///
  /// In en, this message translates to:
  /// **'Filter Campsites'**
  String get filterCampsites;

  /// No description provided for @closeToWater.
  ///
  /// In en, this message translates to:
  /// **'Close to Water'**
  String get closeToWater;

  /// No description provided for @campFireAllowed.
  ///
  /// In en, this message translates to:
  /// **'Campfire Allowed'**
  String get campFireAllowed;

  /// No description provided for @pricePerNight.
  ///
  /// In en, this message translates to:
  /// **'Price per Night'**
  String get pricePerNight;

  /// No description provided for @hostLanguages.
  ///
  /// In en, this message translates to:
  /// **'Host Languages'**
  String get hostLanguages;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No campsites found'**
  String get noResults;

  /// No description provided for @euros.
  ///
  /// In en, this message translates to:
  /// **'€'**
  String get euros;

  /// No description provided for @en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get en;

  /// No description provided for @de.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get de;

  /// No description provided for @listSeparator.
  ///
  /// In en, this message translates to:
  /// **', '**
  String get listSeparator;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @applyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get applyFilters;

  /// No description provided for @clearFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear Filters'**
  String get clearFilters;

  /// No description provided for @priceRange.
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get priceRange;

  /// No description provided for @minPrice.
  ///
  /// In en, this message translates to:
  /// **'Min Price'**
  String get minPrice;

  /// No description provided for @maxPrice.
  ///
  /// In en, this message translates to:
  /// **'Max Price'**
  String get maxPrice;

  /// No description provided for @closeToWaterDescription.
  ///
  /// In en, this message translates to:
  /// **'Only show campsites near water'**
  String get closeToWaterDescription;

  /// No description provided for @campFireAllowedDescription.
  ///
  /// In en, this message translates to:
  /// **'Only show campsites that allow campfires'**
  String get campFireAllowedDescription;

  /// No description provided for @invalidPriceRange.
  ///
  /// In en, this message translates to:
  /// **'Max price must be greater than or equal to min price'**
  String get invalidPriceRange;

  /// No description provided for @campsiteDetails.
  ///
  /// In en, this message translates to:
  /// **'Campsite Details'**
  String get campsiteDetails;

  /// No description provided for @suitableFor.
  ///
  /// In en, this message translates to:
  /// **'Suitable For'**
  String get suitableFor;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @bookNow.
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get bookNow;

  /// No description provided for @contactHost.
  ///
  /// In en, this message translates to:
  /// **'Contact Host'**
  String get contactHost;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @amenities.
  ///
  /// In en, this message translates to:
  /// **'Amenities'**
  String get amenities;

  /// No description provided for @createdOn.
  ///
  /// In en, this message translates to:
  /// **'Listed on'**
  String get createdOn;

  /// No description provided for @shareLocation.
  ///
  /// In en, this message translates to:
  /// **'Share Location'**
  String get shareLocation;

  /// No description provided for @getDirections.
  ///
  /// In en, this message translates to:
  /// **'Get Directions'**
  String get getDirections;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
