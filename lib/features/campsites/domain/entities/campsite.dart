import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spot_a_camp/core/barrel.dart';

part 'campsite.freezed.dart';
part 'campsite.g.dart';

@freezed
abstract class Campsite with _$Campsite {
  const factory Campsite({
    required String id,
    required String label,
    required String photo,
    required GeoLocation geoLocation,
    required bool isCloseToWater,
    required bool isCampFireAllowed,
    required List<String> hostLanguages,
    required double pricePerNight,
    required List<String> suitableFor,
    required DateTime createdAt,
  }) = _Campsite;

  factory Campsite.fromJson(Map<String, dynamic> json) =>
      _$CampsiteFromJson(json);
}
