import 'package:flutter_test/flutter_test.dart';
import 'package:spot_a_camp/core/domain/entities/geolocation.dart';
import 'package:spot_a_camp/features/campsites/domain/entities/campsite.dart';
import 'package:spot_a_camp/features/campsites/domain/entities/campsite_filters.dart';
import 'package:spot_a_camp/features/campsites/domain/entities/campsite_language.dart';

void main() {
  group('CampsiteFilters', () {
    late Campsite testCampsite;

    setUp(() {
      testCampsite = Campsite(
        id: '1',
        label: 'Test Campsite',
        photo: 'test.jpg',
        geoLocation: const GeoLocation(lat: 45.123, long: -73.456),
        isCloseToWater: true,
        isCampFireAllowed: true,
        hostLanguages: const [
          CampsiteLanguage.enumValue(CampingSiteLanguageEnum.en),
        ],
        pricePerNight: 50.0,
        suitableFor: const ['families'],
        createdAt: DateTime(2023, 1, 1),
      );
    });

    group('hasActiveFilters', () {
      test('should return false when no filters are active', () {
        // Arrange
        const filters = CampsiteFilters();

        // Act & Assert
        expect(filters.hasActiveFilters, isFalse);
      });

      test('should return true when closeToWaterOnly is true', () {
        // Arrange
        const filters = CampsiteFilters(closeToWaterOnly: true);

        // Act & Assert
        expect(filters.hasActiveFilters, isTrue);
      });

      test('should return true when campFireAllowedOnly is true', () {
        // Arrange
        const filters = CampsiteFilters(campFireAllowedOnly: true);

        // Act & Assert
        expect(filters.hasActiveFilters, isTrue);
      });

      test('should return true when minPrice is set', () {
        // Arrange
        const filters = CampsiteFilters(minPrice: 20.0);

        // Act & Assert
        expect(filters.hasActiveFilters, isTrue);
      });

      test('should return true when maxPrice is set', () {
        // Arrange
        const filters = CampsiteFilters(maxPrice: 100.0);

        // Act & Assert
        expect(filters.hasActiveFilters, isTrue);
      });
    });

    group('hasValidPriceRange', () {
      test('should return true when no price filters are set', () {
        // Arrange
        const filters = CampsiteFilters();

        // Act & Assert
        expect(filters.hasValidPriceRange, isTrue);
      });

      test('should return true when only minPrice is set', () {
        // Arrange
        const filters = CampsiteFilters(minPrice: 20.0);

        // Act & Assert
        expect(filters.hasValidPriceRange, isTrue);
      });

      test('should return true when only maxPrice is set', () {
        // Arrange
        const filters = CampsiteFilters(maxPrice: 100.0);

        // Act & Assert
        expect(filters.hasValidPriceRange, isTrue);
      });

      test('should return true when minPrice is less than maxPrice', () {
        // Arrange
        const filters = CampsiteFilters(minPrice: 20.0, maxPrice: 100.0);

        // Act & Assert
        expect(filters.hasValidPriceRange, isTrue);
      });

      test('should return true when minPrice equals maxPrice', () {
        // Arrange
        const filters = CampsiteFilters(minPrice: 50.0, maxPrice: 50.0);

        // Act & Assert
        expect(filters.hasValidPriceRange, isTrue);
      });

      test('should return false when minPrice is greater than maxPrice', () {
        // Arrange
        const filters = CampsiteFilters(minPrice: 100.0, maxPrice: 20.0);

        // Act & Assert
        expect(filters.hasValidPriceRange, isFalse);
      });
    });

    group('matchesCampsite', () {
      test('should return true when no filters are active', () {
        // Arrange
        const filters = CampsiteFilters();

        // Act & Assert
        expect(filters.matchesCampsite(testCampsite), isTrue);
      });

      test(
        'should return true when closeToWaterOnly is true and campsite is close to water',
        () {
          // Arrange
          const filters = CampsiteFilters(closeToWaterOnly: true);

          // Act & Assert
          expect(filters.matchesCampsite(testCampsite), isTrue);
        },
      );

      test(
        'should return false when closeToWaterOnly is true and campsite is not close to water',
        () {
          // Arrange
          const filters = CampsiteFilters(closeToWaterOnly: true);
          final campsite = testCampsite.copyWith(isCloseToWater: false);

          // Act & Assert
          expect(filters.matchesCampsite(campsite), isFalse);
        },
      );

      test(
        'should return true when campFireAllowedOnly is true and campsite allows campfire',
        () {
          // Arrange
          const filters = CampsiteFilters(campFireAllowedOnly: true);

          // Act & Assert
          expect(filters.matchesCampsite(testCampsite), isTrue);
        },
      );

      test(
        'should return false when campFireAllowedOnly is true and campsite does not allow campfire',
        () {
          // Arrange
          const filters = CampsiteFilters(campFireAllowedOnly: true);
          final campsite = testCampsite.copyWith(isCampFireAllowed: false);

          // Act & Assert
          expect(filters.matchesCampsite(campsite), isFalse);
        },
      );

      test('should return true when price is within range', () {
        // Arrange
        const filters = CampsiteFilters(minPrice: 30.0, maxPrice: 70.0);

        // Act & Assert
        expect(filters.matchesCampsite(testCampsite), isTrue);
      });

      test('should return false when price is below minimum', () {
        // Arrange
        const filters = CampsiteFilters(minPrice: 60.0);

        // Act & Assert
        expect(filters.matchesCampsite(testCampsite), isFalse);
      });

      test('should return false when price is above maximum', () {
        // Arrange
        const filters = CampsiteFilters(maxPrice: 40.0);

        // Act & Assert
        expect(filters.matchesCampsite(testCampsite), isFalse);
      });

      test('should return true when price equals minimum', () {
        // Arrange
        const filters = CampsiteFilters(minPrice: 50.0);

        // Act & Assert
        expect(filters.matchesCampsite(testCampsite), isTrue);
      });

      test('should return true when price equals maximum', () {
        // Arrange
        const filters = CampsiteFilters(maxPrice: 50.0);

        // Act & Assert
        expect(filters.matchesCampsite(testCampsite), isTrue);
      });

      test('should ignore price filters when price range is invalid', () {
        // Arrange
        const filters = CampsiteFilters(minPrice: 100.0, maxPrice: 20.0);
        final expensiveCampsite = testCampsite.copyWith(pricePerNight: 150.0);

        // Act & Assert
        expect(filters.matchesCampsite(expensiveCampsite), isTrue);
      });

      test('should apply multiple filters correctly', () {
        // Arrange
        const filters = CampsiteFilters(
          closeToWaterOnly: true,
          campFireAllowedOnly: true,
          minPrice: 30.0,
          maxPrice: 70.0,
        );

        // Act & Assert
        expect(filters.matchesCampsite(testCampsite), isTrue);
      });

      test('should fail when any filter condition is not met', () {
        // Arrange
        const filters = CampsiteFilters(
          closeToWaterOnly: true,
          campFireAllowedOnly: true,
          minPrice: 30.0,
          maxPrice: 70.0,
        );
        final campsite = testCampsite.copyWith(isCloseToWater: false);

        // Act & Assert
        expect(filters.matchesCampsite(campsite), isFalse);
      });
    });

    group('copyWith', () {
      test('should create a copy with updated values', () {
        // Arrange
        const original = CampsiteFilters(
          closeToWaterOnly: true,
          minPrice: 20.0,
        );

        // Act
        final updated = original.copyWith(
          campFireAllowedOnly: true,
          maxPrice: 100.0,
        );

        // Assert
        expect(updated.closeToWaterOnly, isTrue);
        expect(updated.campFireAllowedOnly, isTrue);
        expect(updated.minPrice, equals(20.0));
        expect(updated.maxPrice, equals(100.0));
      });
    });
  });
}
