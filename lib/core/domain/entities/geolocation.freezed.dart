// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geolocation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeoLocation {

 double get lat; double get long;
/// Create a copy of GeoLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoLocationCopyWith<GeoLocation> get copyWith => _$GeoLocationCopyWithImpl<GeoLocation>(this as GeoLocation, _$identity);

  /// Serializes this GeoLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoLocation&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,long);

@override
String toString() {
  return 'GeoLocation(lat: $lat, long: $long)';
}


}

/// @nodoc
abstract mixin class $GeoLocationCopyWith<$Res>  {
  factory $GeoLocationCopyWith(GeoLocation value, $Res Function(GeoLocation) _then) = _$GeoLocationCopyWithImpl;
@useResult
$Res call({
 double lat, double long
});




}
/// @nodoc
class _$GeoLocationCopyWithImpl<$Res>
    implements $GeoLocationCopyWith<$Res> {
  _$GeoLocationCopyWithImpl(this._self, this._then);

  final GeoLocation _self;
  final $Res Function(GeoLocation) _then;

/// Create a copy of GeoLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? long = null,}) {
  return _then(_self.copyWith(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GeoLocation implements GeoLocation {
  const _GeoLocation({required this.lat, required this.long});
  factory _GeoLocation.fromJson(Map<String, dynamic> json) => _$GeoLocationFromJson(json);

@override final  double lat;
@override final  double long;

/// Create a copy of GeoLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoLocationCopyWith<_GeoLocation> get copyWith => __$GeoLocationCopyWithImpl<_GeoLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeoLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoLocation&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,long);

@override
String toString() {
  return 'GeoLocation(lat: $lat, long: $long)';
}


}

/// @nodoc
abstract mixin class _$GeoLocationCopyWith<$Res> implements $GeoLocationCopyWith<$Res> {
  factory _$GeoLocationCopyWith(_GeoLocation value, $Res Function(_GeoLocation) _then) = __$GeoLocationCopyWithImpl;
@override @useResult
$Res call({
 double lat, double long
});




}
/// @nodoc
class __$GeoLocationCopyWithImpl<$Res>
    implements _$GeoLocationCopyWith<$Res> {
  __$GeoLocationCopyWithImpl(this._self, this._then);

  final _GeoLocation _self;
  final $Res Function(_GeoLocation) _then;

/// Create a copy of GeoLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? long = null,}) {
  return _then(_GeoLocation(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
