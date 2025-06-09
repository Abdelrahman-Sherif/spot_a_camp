import 'package:flutter_test/flutter_test.dart';
import 'package:spot_a_camp/core/domain/entities/geolocation.dart';

void main() {
  group('GeoLocation', () {
    test('should create GeoLocation with correct values', () {
      // Arrange
      const lat = 45.123;
      const long = -73.456;

      // Act
      const geoLocation = GeoLocation(lat: lat, long: long);

      // Assert
      expect(geoLocation.lat, equals(lat));
      expect(geoLocation.long, equals(long));
    });

    test('should serialize to JSON correctly', () {
      // Arrange
      const geoLocation = GeoLocation(lat: 45.123, long: -73.456);

      // Act
      final json = geoLocation.toJson();

      // Assert
      expect(json, {'lat': 45.123, 'long': -73.456});
    });

    test('should deserialize from JSON with division by 1000', () {
      // Arrange
      final json = {
        'lat': 45123.0, // Will be divided by 1000
        'long': -73456.0, // Will be divided by 1000
      };

      // Act
      final geoLocation = GeoLocation.fromJson(json);

      // Assert
      expect(geoLocation.lat, equals(45.123));
      expect(geoLocation.long, equals(-73.456));
    });

    test('should handle integer values in JSON', () {
      // Arrange
      final json = {
        'lat': 45123, // Integer that will be divided by 1000
        'long': -73456, // Integer that will be divided by 1000
      };

      // Act
      final geoLocation = GeoLocation.fromJson(json);

      // Assert
      expect(geoLocation.lat, equals(45.123));
      expect(geoLocation.long, equals(-73.456));
    });

    test('should handle zero values', () {
      // Arrange
      final json = {'lat': 0.0, 'long': 0.0};

      // Act
      final geoLocation = GeoLocation.fromJson(json);

      // Assert
      expect(geoLocation.lat, equals(0.0));
      expect(geoLocation.long, equals(0.0));
    });

    test('should handle negative values correctly', () {
      // Arrange
      final json = {'lat': -45123.0, 'long': 73456.0};

      // Act
      final geoLocation = GeoLocation.fromJson(json);

      // Assert
      expect(geoLocation.lat, equals(-45.123));
      expect(geoLocation.long, equals(73.456));
    });
  });
}
