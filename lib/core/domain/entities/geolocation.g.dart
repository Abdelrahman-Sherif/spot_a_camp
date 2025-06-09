// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geolocation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeoLocation _$GeoLocationFromJson(Map<String, dynamic> json) => _GeoLocation(
  lat: _divideBy1000((json['lat'] as num).toDouble()),
  long: _divideBy1000((json['long'] as num).toDouble()),
);

Map<String, dynamic> _$GeoLocationToJson(_GeoLocation instance) =>
    <String, dynamic>{'lat': instance.lat, 'long': instance.long};
