import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spot_a_camp/core/barrel.dart';
import 'package:spot_a_camp/features/campsites/barrel.dart';

part 'campsite.freezed.dart';
part 'campsite.g.dart';

List<CampsiteLanguage> _campsiteLanguageFromJson(List<dynamic> value) =>
    value.map((remoteLanguage) {
      final parsedLanguage = CampingSiteLanguageEnum.values.firstWhereOrNull(
        (e) => e.name == remoteLanguage,
      );

      return parsedLanguage != null
          ? CampsiteLanguage.enumValue(parsedLanguage)
          : CampsiteLanguage.string(remoteLanguage);
    }).toList();

List<dynamic> _campsiteLanguageToJson(List<CampsiteLanguage> value) => value
    .map(
      (language) => switch (language) {
        CampsiteLanguageEnum(value: var enumValue) => enumValue.name,
        CampsiteLanguageString(value: var stringValue) => stringValue,
      },
    )
    .toList();

@freezed
abstract class Campsite with _$Campsite {
  const factory Campsite({
    required String id,
    required String label,
    required String photo,
    required GeoLocation geoLocation,
    required bool isCloseToWater,
    required bool isCampFireAllowed,
    @JsonKey(
      fromJson: _campsiteLanguageFromJson,
      toJson: _campsiteLanguageToJson,
    )
    required List<CampsiteLanguage> hostLanguages,
    required double pricePerNight,
    required List<String> suitableFor,
    required DateTime createdAt,
  }) = _Campsite;

  factory Campsite.fromJson(Map<String, dynamic> json) =>
      _$CampsiteFromJson(json);
}
