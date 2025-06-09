import 'package:flutter_test/flutter_test.dart';
import 'package:spot_a_camp/core/domain/entities/geolocation.dart';
import 'package:spot_a_camp/features/campsites/domain/entities/campsite.dart';
import 'package:spot_a_camp/features/campsites/domain/entities/campsite_language.dart';

void main() {
  group('Campsite', () {
    late Campsite testCampsite;
    late Map<String, dynamic> testJson;

    setUp(() {
      testCampsite = Campsite(
        id: '1',
        label: 'Beautiful Lake Campsite',
        photo: 'https://example.com/photo.jpg',
        geoLocation: const GeoLocation(lat: 45.123, long: -73.456),
        isCloseToWater: true,
        isCampFireAllowed: true,
        hostLanguages: const [
          CampsiteLanguage.enumValue(CampingSiteLanguageEnum.en),
          CampsiteLanguage.enumValue(CampingSiteLanguageEnum.de),
        ],
        pricePerNight: 75.50,
        suitableFor: const ['families', 'couples'],
        createdAt: DateTime(2023, 6, 15, 10, 30),
      );

      testJson = {
        'id': '1',
        'label': 'Beautiful Lake Campsite',
        'photo': 'https://example.com/photo.jpg',
        'geoLocation': {
          'lat': 45123.0, // Will be divided by 1000
          'long': -73456.0, // Will be divided by 1000
        },
        'isCloseToWater': true,
        'isCampFireAllowed': true,
        'hostLanguages': ['en', 'de'],
        'pricePerNight': 75.50,
        'suitableFor': ['families', 'couples'],
        'createdAt': '2023-06-15T10:30:00.000',
      };
    });

    test('should create Campsite with all required fields', () {
      // Act & Assert
      expect(testCampsite.id, equals('1'));
      expect(testCampsite.label, equals('Beautiful Lake Campsite'));
      expect(testCampsite.photo, equals('https://example.com/photo.jpg'));
      expect(testCampsite.geoLocation.lat, equals(45.123));
      expect(testCampsite.geoLocation.long, equals(-73.456));
      expect(testCampsite.isCloseToWater, isTrue);
      expect(testCampsite.isCampFireAllowed, isTrue);
      expect(testCampsite.hostLanguages, hasLength(2));
      expect(testCampsite.pricePerNight, equals(75.50));
      expect(testCampsite.suitableFor, equals(['families', 'couples']));
      expect(testCampsite.createdAt, equals(DateTime(2023, 6, 15, 10, 30)));
    });

    test('should serialize to JSON correctly', () {
      // Act
      final json = testCampsite.toJson();

      // Assert
      expect(json['id'], equals('1'));
      expect(json['label'], equals('Beautiful Lake Campsite'));
      expect(json['photo'], equals('https://example.com/photo.jpg'));
      expect(json['geoLocation'], isNotNull);
      expect(json['isCloseToWater'], isTrue);
      expect(json['isCampFireAllowed'], isTrue);
      expect(json['hostLanguages'], equals(['en', 'de']));
      expect(json['pricePerNight'], equals(75.50));
      expect(json['suitableFor'], equals(['families', 'couples']));
      expect(json['createdAt'], isA<String>());
    });

    test('should deserialize from JSON correctly', () {
      // Act
      final campsite = Campsite.fromJson(testJson);

      // Assert
      expect(campsite.id, equals('1'));
      expect(campsite.label, equals('Beautiful Lake Campsite'));
      expect(campsite.photo, equals('https://example.com/photo.jpg'));
      expect(campsite.geoLocation.lat, equals(45.123));
      expect(campsite.geoLocation.long, equals(-73.456));
      expect(campsite.isCloseToWater, isTrue);
      expect(campsite.isCampFireAllowed, isTrue);
      expect(campsite.hostLanguages, hasLength(2));
      expect(campsite.pricePerNight, equals(75.50));
      expect(campsite.suitableFor, equals(['families', 'couples']));
    });

    test('should handle known language enums in JSON', () {
      // Arrange
      final jsonWithKnownLanguages = Map<String, dynamic>.from(testJson);
      jsonWithKnownLanguages['hostLanguages'] = ['en', 'de'];

      // Act
      final campsite = Campsite.fromJson(jsonWithKnownLanguages);

      // Assert
      expect(campsite.hostLanguages, hasLength(2));
      expect(campsite.hostLanguages[0], isA<CampsiteLanguageEnum>());
      expect(campsite.hostLanguages[1], isA<CampsiteLanguageEnum>());
    });

    test('should handle unknown language strings in JSON', () {
      // Arrange
      final jsonWithUnknownLanguages = Map<String, dynamic>.from(testJson);
      jsonWithUnknownLanguages['hostLanguages'] = ['fr', 'es', 'en'];

      // Act
      final campsite = Campsite.fromJson(jsonWithUnknownLanguages);

      // Assert
      expect(campsite.hostLanguages, hasLength(3));
      expect(campsite.hostLanguages[0], isA<CampsiteLanguageString>());
      expect(campsite.hostLanguages[1], isA<CampsiteLanguageString>());
      expect(campsite.hostLanguages[2], isA<CampsiteLanguageEnum>());
    });

    test('should handle mixed known and unknown languages in JSON', () {
      // Arrange
      final jsonWithMixedLanguages = Map<String, dynamic>.from(testJson);
      jsonWithMixedLanguages['hostLanguages'] = ['en', 'fr', 'de', 'es'];

      // Act
      final campsite = Campsite.fromJson(jsonWithMixedLanguages);

      // Assert
      expect(campsite.hostLanguages, hasLength(4));

      // First language should be enum (en)
      final firstLang = campsite.hostLanguages[0];
      expect(firstLang, isA<CampsiteLanguageEnum>());

      // Second language should be string (fr)
      final secondLang = campsite.hostLanguages[1];
      expect(secondLang, isA<CampsiteLanguageString>());

      // Third language should be enum (de)
      final thirdLang = campsite.hostLanguages[2];
      expect(thirdLang, isA<CampsiteLanguageEnum>());

      // Fourth language should be string (es)
      final fourthLang = campsite.hostLanguages[3];
      expect(fourthLang, isA<CampsiteLanguageString>());
    });

    test('should handle empty language list in JSON', () {
      // Arrange
      final jsonWithEmptyLanguages = Map<String, dynamic>.from(testJson);
      jsonWithEmptyLanguages['hostLanguages'] = <String>[];

      // Act
      final campsite = Campsite.fromJson(jsonWithEmptyLanguages);

      // Assert
      expect(campsite.hostLanguages, isEmpty);
    });

    test('should handle zero price', () {
      // Arrange
      final jsonWithZeroPrice = Map<String, dynamic>.from(testJson);
      jsonWithZeroPrice['pricePerNight'] = 0.0;

      // Act
      final campsite = Campsite.fromJson(jsonWithZeroPrice);

      // Assert
      expect(campsite.pricePerNight, equals(0.0));
    });

    test('should handle empty suitableFor list', () {
      // Arrange
      final jsonWithEmptySuitableFor = Map<String, dynamic>.from(testJson);
      jsonWithEmptySuitableFor['suitableFor'] = <String>[];

      // Act
      final campsite = Campsite.fromJson(jsonWithEmptySuitableFor);

      // Assert
      expect(campsite.suitableFor, isEmpty);
    });

    test('should create copy with updated values', () {
      // Act
      final updatedCampsite = testCampsite.copyWith(
        label: 'Updated Campsite Name',
        pricePerNight: 100.0,
        isCloseToWater: false,
      );

      // Assert
      expect(updatedCampsite.id, equals(testCampsite.id)); // Unchanged
      expect(updatedCampsite.label, equals('Updated Campsite Name')); // Changed
      expect(updatedCampsite.pricePerNight, equals(100.0)); // Changed
      expect(updatedCampsite.isCloseToWater, isFalse); // Changed
      expect(
        updatedCampsite.isCampFireAllowed,
        equals(testCampsite.isCampFireAllowed),
      ); // Unchanged
    });
  });
}
