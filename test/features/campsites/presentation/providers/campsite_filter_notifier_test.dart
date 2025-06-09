import 'package:flutter_test/flutter_test.dart';
import 'package:spot_a_camp/features/campsites/domain/entities/campsite_filters.dart';
import 'package:spot_a_camp/features/campsites/presentation/providers/campsite_filter_notifier.dart';

void main() {
  group('CampsiteFilterNotifier', () {
    late CampsiteFilterNotifier notifier;

    setUp(() {
      notifier = CampsiteFilterNotifier();
    });

    test('should initialize with empty filters', () {
      // Assert
      expect(notifier.state, equals(const CampsiteFilters()));
      expect(notifier.hasActiveFilters, isFalse);
    });

    test('should clear filters', () {
      // Arrange
      const filters = CampsiteFilters(
        closeToWaterOnly: true,
        campFireAllowedOnly: true,
        minPrice: 20.0,
        maxPrice: 100.0,
      );
      notifier.applyFilters(filters);

      // Act
      notifier.clearFilters();

      // Assert
      expect(notifier.state, equals(const CampsiteFilters()));
      expect(notifier.hasActiveFilters, isFalse);
    });

    test('should apply filters', () {
      // Arrange
      const filters = CampsiteFilters(
        closeToWaterOnly: true,
        campFireAllowedOnly: true,
        minPrice: 20.0,
        maxPrice: 100.0,
      );

      // Act
      notifier.applyFilters(filters);

      // Assert
      expect(notifier.state, equals(filters));
      expect(notifier.hasActiveFilters, isTrue);
    });

    test('should return correct hasActiveFilters status', () {
      // Initially false
      expect(notifier.hasActiveFilters, isFalse);

      // Apply filters with active values
      notifier.applyFilters(const CampsiteFilters(closeToWaterOnly: true));
      expect(notifier.hasActiveFilters, isTrue);

      // Clear filters
      notifier.clearFilters();
      expect(notifier.hasActiveFilters, isFalse);
    });
  });

  group('TempFilterNotifier', () {
    late TempFilterNotifier notifier;
    late CampsiteFilters initialFilters;

    setUp(() {
      initialFilters = const CampsiteFilters(
        closeToWaterOnly: true,
        minPrice: 30.0,
      );
      notifier = TempFilterNotifier(initialFilters);
    });

    test('should initialize with provided filters', () {
      // Assert
      expect(notifier.state.filters, equals(initialFilters));
      expect(notifier.state.showValidationError, isFalse);
    });

    test('should update close to water filter', () {
      // Act
      notifier.updateCloseToWater(false);

      // Assert
      expect(notifier.state.filters.closeToWaterOnly, isFalse);
      expect(
        notifier.state.filters.minPrice,
        equals(30.0),
      ); // Other values unchanged
    });

    test('should update camp fire allowed filter', () {
      // Act
      notifier.updateCampFireAllowed(true);

      // Assert
      expect(notifier.state.filters.campFireAllowedOnly, isTrue);
      expect(
        notifier.state.filters.closeToWaterOnly,
        isTrue,
      ); // Other values unchanged
    });

    test('should update min price and clear validation error', () {
      // Arrange
      notifier.validateAndShowError(); // Set validation error first
      expect(notifier.state.showValidationError, isFalse); // No error initially

      // Act
      notifier.updateMinPrice(50.0);

      // Assert
      expect(notifier.state.filters.minPrice, equals(50.0));
      expect(notifier.state.showValidationError, isFalse);
    });

    test('should update max price and clear validation error', () {
      // Arrange
      // Set invalid range first
      notifier.updateMinPrice(100.0);
      notifier.updateMaxPrice(50.0);
      notifier.validateAndShowError();
      expect(notifier.state.showValidationError, isTrue);

      // Act
      notifier.updateMaxPrice(150.0);

      // Assert
      expect(notifier.state.filters.maxPrice, equals(150.0));
      expect(notifier.state.showValidationError, isFalse);
    });

    test('should validate and show error for invalid price range', () {
      // Arrange
      notifier.updateMinPrice(100.0);
      notifier.updateMaxPrice(50.0);

      // Act
      final isValid = notifier.validateAndShowError();

      // Assert
      expect(isValid, isFalse);
      expect(notifier.state.showValidationError, isTrue);
    });

    test('should validate and return true for valid price range', () {
      // Arrange
      notifier.updateMinPrice(50.0);
      notifier.updateMaxPrice(100.0);

      // Act
      final isValid = notifier.validateAndShowError();

      // Assert
      expect(isValid, isTrue);
      expect(notifier.state.showValidationError, isFalse);
    });

    test('should validate and return true when no price filters are set', () {
      // Arrange
      notifier.updateMinPrice(null);
      notifier.updateMaxPrice(null);

      // Act
      final isValid = notifier.validateAndShowError();

      // Assert
      expect(isValid, isTrue);
      expect(notifier.state.showValidationError, isFalse);
    });

    test('should validate and return true when only min price is set', () {
      // Arrange
      notifier.updateMinPrice(50.0);
      notifier.updateMaxPrice(null);

      // Act
      final isValid = notifier.validateAndShowError();

      // Assert
      expect(isValid, isTrue);
      expect(notifier.state.showValidationError, isFalse);
    });

    test('should validate and return true when only max price is set', () {
      // Arrange
      notifier.updateMinPrice(null);
      notifier.updateMaxPrice(100.0);

      // Act
      final isValid = notifier.validateAndShowError();

      // Assert
      expect(isValid, isTrue);
      expect(notifier.state.showValidationError, isFalse);
    });

    test('should clear validation error', () {
      // Arrange
      notifier.updateMinPrice(100.0);
      notifier.updateMaxPrice(50.0);
      notifier.validateAndShowError();
      expect(notifier.state.showValidationError, isTrue);

      // Act
      notifier.clearValidationError();

      // Assert
      expect(notifier.state.showValidationError, isFalse);
    });

    test('should reset to provided filters', () {
      // Arrange
      const newFilters = CampsiteFilters(
        campFireAllowedOnly: true,
        maxPrice: 200.0,
      );
      notifier.updateCloseToWater(false);
      notifier.updateMinPrice(100.0);

      // Act
      notifier.reset(newFilters);

      // Assert
      expect(notifier.state.filters, equals(newFilters));
      expect(notifier.state.showValidationError, isFalse);
    });

    test('should clear all filters', () {
      // Arrange
      notifier.updateCloseToWater(true);
      notifier.updateCampFireAllowed(true);
      notifier.updateMinPrice(50.0);
      notifier.updateMaxPrice(100.0);

      // Act
      notifier.clear();

      // Assert
      expect(notifier.state.filters, equals(const CampsiteFilters()));
      expect(notifier.state.showValidationError, isFalse);
    });

    test('should handle null price values correctly', () {
      // Act
      notifier.updateMinPrice(null);
      notifier.updateMaxPrice(null);

      // Assert
      expect(notifier.state.filters.minPrice, isNull);
      expect(notifier.state.filters.maxPrice, isNull);
    });

    test(
      'should maintain other filter values when updating individual filters',
      () {
        // Arrange
        notifier.updateCloseToWater(true);
        notifier.updateCampFireAllowed(true);
        notifier.updateMinPrice(25.0);
        notifier.updateMaxPrice(75.0);

        // Act - Update only one filter
        notifier.updateCloseToWater(false);

        // Assert - Other values should remain unchanged
        expect(notifier.state.filters.closeToWaterOnly, isFalse);
        expect(notifier.state.filters.campFireAllowedOnly, isTrue);
        expect(notifier.state.filters.minPrice, equals(25.0));
        expect(notifier.state.filters.maxPrice, equals(75.0));
      },
    );
  });

  group('TempFilterState', () {
    test('should create TempFilterState with default values', () {
      // Arrange
      const filters = CampsiteFilters(closeToWaterOnly: true);

      // Act
      const state = TempFilterState(filters: filters);

      // Assert
      expect(state.filters, equals(filters));
      expect(state.showValidationError, isFalse);
    });

    test('should create TempFilterState with custom validation error', () {
      // Arrange
      const filters = CampsiteFilters(minPrice: 100.0, maxPrice: 50.0);

      // Act
      const state = TempFilterState(
        filters: filters,
        showValidationError: true,
      );

      // Assert
      expect(state.filters, equals(filters));
      expect(state.showValidationError, isTrue);
    });

    test('should create copy with updated values', () {
      // Arrange
      const originalState = TempFilterState(
        filters: CampsiteFilters(closeToWaterOnly: true),
        showValidationError: false,
      );

      // Act
      final updatedState = originalState.copyWith(showValidationError: true);

      // Assert
      expect(updatedState.filters, equals(originalState.filters));
      expect(updatedState.showValidationError, isTrue);
    });
  });
}
