import 'package:flutter_test/flutter_test.dart';
import 'package:spot_a_camp/features/campsites/data/datasources/campsite_datasource.dart';
import 'package:spot_a_camp/features/campsites/domain/entities/campsite.dart';
import 'package:spot_a_camp/features/campsites/domain/repository/campsite_repository.dart';

// Test implementation of CampsiteDatasource
class TestCampsiteDatasource extends CampsiteDatasource {
  final List<dynamic> _mockData;
  final Exception? _exception;

  TestCampsiteDatasource({List<dynamic>? mockData, Exception? exception})
    : _mockData = mockData ?? [],
      _exception = exception;

  @override
  Future<List<dynamic>> getCampsites() async {
    if (_exception != null) {
      throw _exception!;
    }
    return _mockData;
  }
}

void main() {
  group('CampsiteRepository', () {
    test(
      'should return list of campsites when datasource call is successful',
      () async {
        // Arrange
        final mockResponse = [
          {
            'id': '1',
            'label': 'Beautiful Lake Campsite',
            'photo': 'https://example.com/photo1.jpg',
            'geoLocation': {'lat': 45123.0, 'long': -73456.0},
            'isCloseToWater': true,
            'isCampFireAllowed': true,
            'hostLanguages': ['en', 'de'],
            'pricePerNight': 75.50,
            'suitableFor': ['families', 'couples'],
            'createdAt': '2023-06-15T10:30:00.000Z',
          },
          {
            'id': '2',
            'label': 'Mountain View Campsite',
            'photo': 'https://example.com/photo2.jpg',
            'geoLocation': {'lat': 46789.0, 'long': -74123.0},
            'isCloseToWater': false,
            'isCampFireAllowed': true,
            'hostLanguages': ['en', 'fr'],
            'pricePerNight': 60.00,
            'suitableFor': ['adventurers'],
            'createdAt': '2023-06-16T14:20:00.000Z',
          },
        ];

        final datasource = TestCampsiteDatasource(mockData: mockResponse);
        final repository = CampsiteRepository(datasource);

        // Act
        final result = await repository.getCampsites();

        // Assert
        expect(result, isA<List<Campsite>>());
        expect(result, hasLength(2));

        // Verify first campsite
        expect(result[0].id, equals('1'));
        expect(result[0].label, equals('Beautiful Lake Campsite'));
        expect(result[0].photo, equals('https://example.com/photo1.jpg'));
        expect(result[0].geoLocation.lat, equals(45.123)); // Divided by 1000
        expect(result[0].geoLocation.long, equals(-73.456)); // Divided by 1000
        expect(result[0].isCloseToWater, isTrue);
        expect(result[0].isCampFireAllowed, isTrue);
        expect(result[0].hostLanguages, hasLength(2));
        expect(result[0].pricePerNight, equals(75.50));
        expect(result[0].suitableFor, equals(['families', 'couples']));

        // Verify second campsite
        expect(result[1].id, equals('2'));
        expect(result[1].label, equals('Mountain View Campsite'));
        expect(result[1].geoLocation.lat, equals(46.789)); // Divided by 1000
        expect(result[1].geoLocation.long, equals(-74.123)); // Divided by 1000
        expect(result[1].isCloseToWater, isFalse);
        expect(result[1].pricePerNight, equals(60.00));
        expect(result[1].suitableFor, equals(['adventurers']));
      },
    );

    test('should handle empty response from datasource', () async {
      // Arrange
      final datasource = TestCampsiteDatasource(mockData: []);
      final repository = CampsiteRepository(datasource);

      // Act
      final result = await repository.getCampsites();

      // Assert
      expect(result, isA<List<Campsite>>());
      expect(result, isEmpty);
    });

    test('should propagate exception from datasource', () async {
      // Arrange
      final exception = Exception('Network error');
      final datasource = TestCampsiteDatasource(exception: exception);
      final repository = CampsiteRepository(datasource);

      // Act & Assert
      expect(() => repository.getCampsites(), throwsA(equals(exception)));
    });

    test('should handle single campsite response', () async {
      // Arrange
      final mockResponse = [
        {
          'id': '1',
          'label': 'Solo Campsite',
          'photo': 'solo.jpg',
          'geoLocation': {'lat': 45123.0, 'long': -73456.0},
          'isCloseToWater': false,
          'isCampFireAllowed': false,
          'hostLanguages': ['en'],
          'pricePerNight': 25.0,
          'suitableFor': ['solo'],
          'createdAt': '2023-06-15T10:30:00.000Z',
        },
      ];

      final datasource = TestCampsiteDatasource(mockData: mockResponse);
      final repository = CampsiteRepository(datasource);

      // Act
      final result = await repository.getCampsites();

      // Assert
      expect(result, hasLength(1));
      expect(result[0].id, equals('1'));
      expect(result[0].label, equals('Solo Campsite'));
    });

    test(
      'should handle campsites with different language configurations',
      () async {
        // Arrange
        final mockResponse = [
          {
            'id': '1',
            'label': 'Multi-language Campsite',
            'photo': 'multi.jpg',
            'geoLocation': {'lat': 45123.0, 'long': -73456.0},
            'isCloseToWater': true,
            'isCampFireAllowed': true,
            'hostLanguages': [
              'en',
              'de',
              'fr',
              'es',
            ], // Mix of known and unknown
            'pricePerNight': 80.0,
            'suitableFor': ['international'],
            'createdAt': '2023-06-15T10:30:00.000Z',
          },
        ];

        final datasource = TestCampsiteDatasource(mockData: mockResponse);
        final repository = CampsiteRepository(datasource);

        // Act
        final result = await repository.getCampsites();

        // Assert
        expect(result, hasLength(1));
        expect(result[0].hostLanguages, hasLength(4));
        // Should handle both known enums (en, de) and unknown strings (fr, es)
      },
    );

    test('should handle zero price campsites', () async {
      // Arrange
      final mockResponse = [
        {
          'id': '1',
          'label': 'Free Campsite',
          'photo': 'free.jpg',
          'geoLocation': {'lat': 45123.0, 'long': -73456.0},
          'isCloseToWater': true,
          'isCampFireAllowed': true,
          'hostLanguages': ['en'],
          'pricePerNight': 0.0,
          'suitableFor': ['budget'],
          'createdAt': '2023-06-15T10:30:00.000Z',
        },
      ];

      final datasource = TestCampsiteDatasource(mockData: mockResponse);
      final repository = CampsiteRepository(datasource);

      // Act
      final result = await repository.getCampsites();

      // Assert
      expect(result, hasLength(1));
      expect(result[0].pricePerNight, equals(0.0));
    });
  });
}
