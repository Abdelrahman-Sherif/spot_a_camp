// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campsite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Campsite _$CampsiteFromJson(Map<String, dynamic> json) => _Campsite(
  id: json['id'] as String,
  label: json['label'] as String,
  photo: json['photo'] as String,
  geoLocation: GeoLocation.fromJson(
    json['geoLocation'] as Map<String, dynamic>,
  ),
  isCloseToWater: json['isCloseToWater'] as bool,
  isCampFireAllowed: json['isCampFireAllowed'] as bool,
  hostLanguages: _campsiteLanguageFromJson(json['hostLanguages'] as List),
  pricePerNight: (json['pricePerNight'] as num).toDouble(),
  suitableFor: (json['suitableFor'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$CampsiteToJson(_Campsite instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'photo': instance.photo,
  'geoLocation': instance.geoLocation,
  'isCloseToWater': instance.isCloseToWater,
  'isCampFireAllowed': instance.isCampFireAllowed,
  'hostLanguages': _campsiteLanguageToJson(instance.hostLanguages),
  'pricePerNight': instance.pricePerNight,
  'suitableFor': instance.suitableFor,
  'createdAt': instance.createdAt.toIso8601String(),
};
