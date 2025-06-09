// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campsite_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CampsiteFilters {

 bool get closeToWaterOnly; bool get campFireAllowedOnly; double? get minPrice; double? get maxPrice;
/// Create a copy of CampsiteFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampsiteFiltersCopyWith<CampsiteFilters> get copyWith => _$CampsiteFiltersCopyWithImpl<CampsiteFilters>(this as CampsiteFilters, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampsiteFilters&&(identical(other.closeToWaterOnly, closeToWaterOnly) || other.closeToWaterOnly == closeToWaterOnly)&&(identical(other.campFireAllowedOnly, campFireAllowedOnly) || other.campFireAllowedOnly == campFireAllowedOnly)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice));
}


@override
int get hashCode => Object.hash(runtimeType,closeToWaterOnly,campFireAllowedOnly,minPrice,maxPrice);

@override
String toString() {
  return 'CampsiteFilters(closeToWaterOnly: $closeToWaterOnly, campFireAllowedOnly: $campFireAllowedOnly, minPrice: $minPrice, maxPrice: $maxPrice)';
}


}

/// @nodoc
abstract mixin class $CampsiteFiltersCopyWith<$Res>  {
  factory $CampsiteFiltersCopyWith(CampsiteFilters value, $Res Function(CampsiteFilters) _then) = _$CampsiteFiltersCopyWithImpl;
@useResult
$Res call({
 bool closeToWaterOnly, bool campFireAllowedOnly, double? minPrice, double? maxPrice
});




}
/// @nodoc
class _$CampsiteFiltersCopyWithImpl<$Res>
    implements $CampsiteFiltersCopyWith<$Res> {
  _$CampsiteFiltersCopyWithImpl(this._self, this._then);

  final CampsiteFilters _self;
  final $Res Function(CampsiteFilters) _then;

/// Create a copy of CampsiteFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? closeToWaterOnly = null,Object? campFireAllowedOnly = null,Object? minPrice = freezed,Object? maxPrice = freezed,}) {
  return _then(_self.copyWith(
closeToWaterOnly: null == closeToWaterOnly ? _self.closeToWaterOnly : closeToWaterOnly // ignore: cast_nullable_to_non_nullable
as bool,campFireAllowedOnly: null == campFireAllowedOnly ? _self.campFireAllowedOnly : campFireAllowedOnly // ignore: cast_nullable_to_non_nullable
as bool,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc


class _CampsiteFilters extends CampsiteFilters {
  const _CampsiteFilters({this.closeToWaterOnly = false, this.campFireAllowedOnly = false, this.minPrice, this.maxPrice}): super._();
  

@override@JsonKey() final  bool closeToWaterOnly;
@override@JsonKey() final  bool campFireAllowedOnly;
@override final  double? minPrice;
@override final  double? maxPrice;

/// Create a copy of CampsiteFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampsiteFiltersCopyWith<_CampsiteFilters> get copyWith => __$CampsiteFiltersCopyWithImpl<_CampsiteFilters>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampsiteFilters&&(identical(other.closeToWaterOnly, closeToWaterOnly) || other.closeToWaterOnly == closeToWaterOnly)&&(identical(other.campFireAllowedOnly, campFireAllowedOnly) || other.campFireAllowedOnly == campFireAllowedOnly)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice));
}


@override
int get hashCode => Object.hash(runtimeType,closeToWaterOnly,campFireAllowedOnly,minPrice,maxPrice);

@override
String toString() {
  return 'CampsiteFilters(closeToWaterOnly: $closeToWaterOnly, campFireAllowedOnly: $campFireAllowedOnly, minPrice: $minPrice, maxPrice: $maxPrice)';
}


}

/// @nodoc
abstract mixin class _$CampsiteFiltersCopyWith<$Res> implements $CampsiteFiltersCopyWith<$Res> {
  factory _$CampsiteFiltersCopyWith(_CampsiteFilters value, $Res Function(_CampsiteFilters) _then) = __$CampsiteFiltersCopyWithImpl;
@override @useResult
$Res call({
 bool closeToWaterOnly, bool campFireAllowedOnly, double? minPrice, double? maxPrice
});




}
/// @nodoc
class __$CampsiteFiltersCopyWithImpl<$Res>
    implements _$CampsiteFiltersCopyWith<$Res> {
  __$CampsiteFiltersCopyWithImpl(this._self, this._then);

  final _CampsiteFilters _self;
  final $Res Function(_CampsiteFilters) _then;

/// Create a copy of CampsiteFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? closeToWaterOnly = null,Object? campFireAllowedOnly = null,Object? minPrice = freezed,Object? maxPrice = freezed,}) {
  return _then(_CampsiteFilters(
closeToWaterOnly: null == closeToWaterOnly ? _self.closeToWaterOnly : closeToWaterOnly // ignore: cast_nullable_to_non_nullable
as bool,campFireAllowedOnly: null == campFireAllowedOnly ? _self.campFireAllowedOnly : campFireAllowedOnly // ignore: cast_nullable_to_non_nullable
as bool,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
