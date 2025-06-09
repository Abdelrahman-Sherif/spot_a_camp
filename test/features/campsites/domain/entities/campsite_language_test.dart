import 'package:flutter_test/flutter_test.dart';
import 'package:spot_a_camp/features/campsites/domain/entities/campsite_language.dart';

void main() {
  group('CampsiteLanguage', () {
    group('CampsiteLanguageEnum', () {
      test('should create enum variant with English', () {
        // Act
        const language = CampsiteLanguage.enumValue(CampingSiteLanguageEnum.en);

        // Assert
        expect(language, isA<CampsiteLanguageEnum>());
        expect(language.value, equals(CampingSiteLanguageEnum.en));
      });

      test('should create enum variant with German', () {
        // Act
        const language = CampsiteLanguage.enumValue(CampingSiteLanguageEnum.de);

        // Assert
        expect(language, isA<CampsiteLanguageEnum>());
        expect(language.value, equals(CampingSiteLanguageEnum.de));
      });

      test('should be equal when same enum value', () {
        // Arrange
        const language1 = CampsiteLanguage.enumValue(
          CampingSiteLanguageEnum.en,
        );
        const language2 = CampsiteLanguage.enumValue(
          CampingSiteLanguageEnum.en,
        );

        // Assert
        expect(language1, equals(language2));
        expect(language1.hashCode, equals(language2.hashCode));
      });

      test('should not be equal when different enum values', () {
        // Arrange
        const language1 = CampsiteLanguage.enumValue(
          CampingSiteLanguageEnum.en,
        );
        const language2 = CampsiteLanguage.enumValue(
          CampingSiteLanguageEnum.de,
        );

        // Assert
        expect(language1, isNot(equals(language2)));
      });
    });

    group('CampsiteLanguageString', () {
      test('should create string variant', () {
        // Act
        const language = CampsiteLanguage.string('fr');

        // Assert
        expect(language, isA<CampsiteLanguageString>());
        expect(language.value, equals('fr'));
      });

      test('should handle empty string', () {
        // Act
        const language = CampsiteLanguage.string('');

        // Assert
        expect(language, isA<CampsiteLanguageString>());
        expect(language.value, equals(''));
      });

      test('should handle special characters', () {
        // Act
        const language = CampsiteLanguage.string('zh-CN');

        // Assert
        expect(language, isA<CampsiteLanguageString>());
        expect(language.value, equals('zh-CN'));
      });

      test('should be equal when same string value', () {
        // Arrange
        const language1 = CampsiteLanguage.string('fr');
        const language2 = CampsiteLanguage.string('fr');

        // Assert
        expect(language1, equals(language2));
        expect(language1.hashCode, equals(language2.hashCode));
      });

      test('should not be equal when different string values', () {
        // Arrange
        const language1 = CampsiteLanguage.string('fr');
        const language2 = CampsiteLanguage.string('es');

        // Assert
        expect(language1, isNot(equals(language2)));
      });

      test('should be case sensitive', () {
        // Arrange
        const language1 = CampsiteLanguage.string('fr');
        const language2 = CampsiteLanguage.string('FR');

        // Assert
        expect(language1, isNot(equals(language2)));
      });
    });

    group('Mixed types', () {
      test('should not be equal when enum vs string with same content', () {
        // Arrange
        const enumLanguage = CampsiteLanguage.enumValue(
          CampingSiteLanguageEnum.en,
        );
        const stringLanguage = CampsiteLanguage.string('en');

        // Assert
        expect(enumLanguage, isNot(equals(stringLanguage)));
      });

      test('should handle pattern matching correctly', () {
        // Arrange
        const enumLanguage = CampsiteLanguage.enumValue(
          CampingSiteLanguageEnum.en,
        );
        const stringLanguage = CampsiteLanguage.string('fr');

        // Act & Assert
        final enumResult = switch (enumLanguage) {
          CampsiteLanguageEnum(value: var enumValue) =>
            'enum: ${enumValue.name}',
          CampsiteLanguageString(value: var stringValue) =>
            'string: $stringValue',
        };

        final stringResult = switch (stringLanguage) {
          CampsiteLanguageEnum(value: var enumValue) =>
            'enum: ${enumValue.name}',
          CampsiteLanguageString(value: var stringValue) =>
            'string: $stringValue',
        };

        expect(enumResult, equals('enum: en'));
        expect(stringResult, equals('string: fr'));
      });
    });

    group('CampingSiteLanguageEnum', () {
      test('should have correct enum values', () {
        // Assert
        expect(CampingSiteLanguageEnum.values, hasLength(2));
        expect(
          CampingSiteLanguageEnum.values,
          contains(CampingSiteLanguageEnum.en),
        );
        expect(
          CampingSiteLanguageEnum.values,
          contains(CampingSiteLanguageEnum.de),
        );
      });

      test('should have correct names', () {
        // Assert
        expect(CampingSiteLanguageEnum.en.name, equals('en'));
        expect(CampingSiteLanguageEnum.de.name, equals('de'));
      });

      test('should have correct indices', () {
        // Assert
        expect(CampingSiteLanguageEnum.en.index, equals(0));
        expect(CampingSiteLanguageEnum.de.index, equals(1));
      });
    });

    group('toString', () {
      test('should have meaningful string representation for enum', () {
        // Arrange
        const language = CampsiteLanguage.enumValue(CampingSiteLanguageEnum.en);

        // Act
        final stringRepresentation = language.toString();

        // Assert
        expect(stringRepresentation, contains('enumValue'));
        expect(stringRepresentation, contains('en'));
      });

      test('should have meaningful string representation for string', () {
        // Arrange
        const language = CampsiteLanguage.string('fr');

        // Act
        final stringRepresentation = language.toString();

        // Assert
        expect(stringRepresentation, contains('string'));
        expect(stringRepresentation, contains('fr'));
      });
    });
  });
}
