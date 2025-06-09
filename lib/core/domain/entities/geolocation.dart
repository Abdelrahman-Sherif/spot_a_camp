import 'package:freezed_annotation/freezed_annotation.dart';

part 'geolocation.freezed.dart';
part 'geolocation.g.dart';

/// Needed because the API returns wrong values for the latitude and longitude.
double _divideBy1000(double value) => value / 1000;

@freezed
abstract class GeoLocation with _$GeoLocation {
  const factory GeoLocation({
    @JsonKey(fromJson: _divideBy1000) required double lat,
    @JsonKey(fromJson: _divideBy1000) required double long,
  }) = _GeoLocation;

  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);
}
