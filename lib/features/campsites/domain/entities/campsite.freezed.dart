// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campsite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Campsite {

 String get id; String get label; String get photo; GeoLocation get geoLocation; bool get isCloseToWater; bool get isCampFireAllowed; List<String> get hostLanguages; double get pricePerNight; List<String> get suitableFor; DateTime get createdAt;
/// Create a copy of Campsite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampsiteCopyWith<Campsite> get copyWith => _$CampsiteCopyWithImpl<Campsite>(this as Campsite, _$identity);

  /// Serializes this Campsite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Campsite&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.geoLocation, geoLocation) || other.geoLocation == geoLocation)&&(identical(other.isCloseToWater, isCloseToWater) || other.isCloseToWater == isCloseToWater)&&(identical(other.isCampFireAllowed, isCampFireAllowed) || other.isCampFireAllowed == isCampFireAllowed)&&const DeepCollectionEquality().equals(other.hostLanguages, hostLanguages)&&(identical(other.pricePerNight, pricePerNight) || other.pricePerNight == pricePerNight)&&const DeepCollectionEquality().equals(other.suitableFor, suitableFor)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,photo,geoLocation,isCloseToWater,isCampFireAllowed,const DeepCollectionEquality().hash(hostLanguages),pricePerNight,const DeepCollectionEquality().hash(suitableFor),createdAt);

@override
String toString() {
  return 'Campsite(id: $id, label: $label, photo: $photo, geoLocation: $geoLocation, isCloseToWater: $isCloseToWater, isCampFireAllowed: $isCampFireAllowed, hostLanguages: $hostLanguages, pricePerNight: $pricePerNight, suitableFor: $suitableFor, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CampsiteCopyWith<$Res>  {
  factory $CampsiteCopyWith(Campsite value, $Res Function(Campsite) _then) = _$CampsiteCopyWithImpl;
@useResult
$Res call({
 String id, String label, String photo, GeoLocation geoLocation, bool isCloseToWater, bool isCampFireAllowed, List<String> hostLanguages, double pricePerNight, List<String> suitableFor, DateTime createdAt
});


$GeoLocationCopyWith<$Res> get geoLocation;

}
/// @nodoc
class _$CampsiteCopyWithImpl<$Res>
    implements $CampsiteCopyWith<$Res> {
  _$CampsiteCopyWithImpl(this._self, this._then);

  final Campsite _self;
  final $Res Function(Campsite) _then;

/// Create a copy of Campsite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? photo = null,Object? geoLocation = null,Object? isCloseToWater = null,Object? isCampFireAllowed = null,Object? hostLanguages = null,Object? pricePerNight = null,Object? suitableFor = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,geoLocation: null == geoLocation ? _self.geoLocation : geoLocation // ignore: cast_nullable_to_non_nullable
as GeoLocation,isCloseToWater: null == isCloseToWater ? _self.isCloseToWater : isCloseToWater // ignore: cast_nullable_to_non_nullable
as bool,isCampFireAllowed: null == isCampFireAllowed ? _self.isCampFireAllowed : isCampFireAllowed // ignore: cast_nullable_to_non_nullable
as bool,hostLanguages: null == hostLanguages ? _self.hostLanguages : hostLanguages // ignore: cast_nullable_to_non_nullable
as List<String>,pricePerNight: null == pricePerNight ? _self.pricePerNight : pricePerNight // ignore: cast_nullable_to_non_nullable
as double,suitableFor: null == suitableFor ? _self.suitableFor : suitableFor // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Campsite
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoLocationCopyWith<$Res> get geoLocation {
  
  return $GeoLocationCopyWith<$Res>(_self.geoLocation, (value) {
    return _then(_self.copyWith(geoLocation: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Campsite implements Campsite {
  const _Campsite({required this.id, required this.label, required this.photo, required this.geoLocation, required this.isCloseToWater, required this.isCampFireAllowed, required final  List<String> hostLanguages, required this.pricePerNight, required final  List<String> suitableFor, required this.createdAt}): _hostLanguages = hostLanguages,_suitableFor = suitableFor;
  factory _Campsite.fromJson(Map<String, dynamic> json) => _$CampsiteFromJson(json);

@override final  String id;
@override final  String label;
@override final  String photo;
@override final  GeoLocation geoLocation;
@override final  bool isCloseToWater;
@override final  bool isCampFireAllowed;
 final  List<String> _hostLanguages;
@override List<String> get hostLanguages {
  if (_hostLanguages is EqualUnmodifiableListView) return _hostLanguages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hostLanguages);
}

@override final  double pricePerNight;
 final  List<String> _suitableFor;
@override List<String> get suitableFor {
  if (_suitableFor is EqualUnmodifiableListView) return _suitableFor;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suitableFor);
}

@override final  DateTime createdAt;

/// Create a copy of Campsite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampsiteCopyWith<_Campsite> get copyWith => __$CampsiteCopyWithImpl<_Campsite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CampsiteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Campsite&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.geoLocation, geoLocation) || other.geoLocation == geoLocation)&&(identical(other.isCloseToWater, isCloseToWater) || other.isCloseToWater == isCloseToWater)&&(identical(other.isCampFireAllowed, isCampFireAllowed) || other.isCampFireAllowed == isCampFireAllowed)&&const DeepCollectionEquality().equals(other._hostLanguages, _hostLanguages)&&(identical(other.pricePerNight, pricePerNight) || other.pricePerNight == pricePerNight)&&const DeepCollectionEquality().equals(other._suitableFor, _suitableFor)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,photo,geoLocation,isCloseToWater,isCampFireAllowed,const DeepCollectionEquality().hash(_hostLanguages),pricePerNight,const DeepCollectionEquality().hash(_suitableFor),createdAt);

@override
String toString() {
  return 'Campsite(id: $id, label: $label, photo: $photo, geoLocation: $geoLocation, isCloseToWater: $isCloseToWater, isCampFireAllowed: $isCampFireAllowed, hostLanguages: $hostLanguages, pricePerNight: $pricePerNight, suitableFor: $suitableFor, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CampsiteCopyWith<$Res> implements $CampsiteCopyWith<$Res> {
  factory _$CampsiteCopyWith(_Campsite value, $Res Function(_Campsite) _then) = __$CampsiteCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String photo, GeoLocation geoLocation, bool isCloseToWater, bool isCampFireAllowed, List<String> hostLanguages, double pricePerNight, List<String> suitableFor, DateTime createdAt
});


@override $GeoLocationCopyWith<$Res> get geoLocation;

}
/// @nodoc
class __$CampsiteCopyWithImpl<$Res>
    implements _$CampsiteCopyWith<$Res> {
  __$CampsiteCopyWithImpl(this._self, this._then);

  final _Campsite _self;
  final $Res Function(_Campsite) _then;

/// Create a copy of Campsite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? photo = null,Object? geoLocation = null,Object? isCloseToWater = null,Object? isCampFireAllowed = null,Object? hostLanguages = null,Object? pricePerNight = null,Object? suitableFor = null,Object? createdAt = null,}) {
  return _then(_Campsite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,geoLocation: null == geoLocation ? _self.geoLocation : geoLocation // ignore: cast_nullable_to_non_nullable
as GeoLocation,isCloseToWater: null == isCloseToWater ? _self.isCloseToWater : isCloseToWater // ignore: cast_nullable_to_non_nullable
as bool,isCampFireAllowed: null == isCampFireAllowed ? _self.isCampFireAllowed : isCampFireAllowed // ignore: cast_nullable_to_non_nullable
as bool,hostLanguages: null == hostLanguages ? _self._hostLanguages : hostLanguages // ignore: cast_nullable_to_non_nullable
as List<String>,pricePerNight: null == pricePerNight ? _self.pricePerNight : pricePerNight // ignore: cast_nullable_to_non_nullable
as double,suitableFor: null == suitableFor ? _self._suitableFor : suitableFor // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Campsite
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoLocationCopyWith<$Res> get geoLocation {
  
  return $GeoLocationCopyWith<$Res>(_self.geoLocation, (value) {
    return _then(_self.copyWith(geoLocation: value));
  });
}
}

// dart format on
