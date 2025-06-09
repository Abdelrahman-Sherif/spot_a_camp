// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campsite_filter_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TempFilterState {

 CampsiteFilters get filters; bool get showValidationError;
/// Create a copy of TempFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TempFilterStateCopyWith<TempFilterState> get copyWith => _$TempFilterStateCopyWithImpl<TempFilterState>(this as TempFilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TempFilterState&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.showValidationError, showValidationError) || other.showValidationError == showValidationError));
}


@override
int get hashCode => Object.hash(runtimeType,filters,showValidationError);

@override
String toString() {
  return 'TempFilterState(filters: $filters, showValidationError: $showValidationError)';
}


}

/// @nodoc
abstract mixin class $TempFilterStateCopyWith<$Res>  {
  factory $TempFilterStateCopyWith(TempFilterState value, $Res Function(TempFilterState) _then) = _$TempFilterStateCopyWithImpl;
@useResult
$Res call({
 CampsiteFilters filters, bool showValidationError
});


$CampsiteFiltersCopyWith<$Res> get filters;

}
/// @nodoc
class _$TempFilterStateCopyWithImpl<$Res>
    implements $TempFilterStateCopyWith<$Res> {
  _$TempFilterStateCopyWithImpl(this._self, this._then);

  final TempFilterState _self;
  final $Res Function(TempFilterState) _then;

/// Create a copy of TempFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filters = null,Object? showValidationError = null,}) {
  return _then(_self.copyWith(
filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as CampsiteFilters,showValidationError: null == showValidationError ? _self.showValidationError : showValidationError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TempFilterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CampsiteFiltersCopyWith<$Res> get filters {
  
  return $CampsiteFiltersCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// @nodoc


class _TempFilterState implements TempFilterState {
  const _TempFilterState({required this.filters, this.showValidationError = false});
  

@override final  CampsiteFilters filters;
@override@JsonKey() final  bool showValidationError;

/// Create a copy of TempFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TempFilterStateCopyWith<_TempFilterState> get copyWith => __$TempFilterStateCopyWithImpl<_TempFilterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TempFilterState&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.showValidationError, showValidationError) || other.showValidationError == showValidationError));
}


@override
int get hashCode => Object.hash(runtimeType,filters,showValidationError);

@override
String toString() {
  return 'TempFilterState(filters: $filters, showValidationError: $showValidationError)';
}


}

/// @nodoc
abstract mixin class _$TempFilterStateCopyWith<$Res> implements $TempFilterStateCopyWith<$Res> {
  factory _$TempFilterStateCopyWith(_TempFilterState value, $Res Function(_TempFilterState) _then) = __$TempFilterStateCopyWithImpl;
@override @useResult
$Res call({
 CampsiteFilters filters, bool showValidationError
});


@override $CampsiteFiltersCopyWith<$Res> get filters;

}
/// @nodoc
class __$TempFilterStateCopyWithImpl<$Res>
    implements _$TempFilterStateCopyWith<$Res> {
  __$TempFilterStateCopyWithImpl(this._self, this._then);

  final _TempFilterState _self;
  final $Res Function(_TempFilterState) _then;

/// Create a copy of TempFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filters = null,Object? showValidationError = null,}) {
  return _then(_TempFilterState(
filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as CampsiteFilters,showValidationError: null == showValidationError ? _self.showValidationError : showValidationError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TempFilterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CampsiteFiltersCopyWith<$Res> get filters {
  
  return $CampsiteFiltersCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}

// dart format on
