// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_incident_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateIncidentState {

 TextEditingController? get stateController; TextEditingController? get cityController; TextEditingController? get addressController; TextEditingController? get howToController; IncidentOutput? get updatedValue; String? get updatedPlaceValue; String? get updateError; String? get errorMessage; String? get errorUpdateStatusMessage; bool get updatedSuccessfully; bool get deletedSuccessfully; bool get isFormValid; bool get isLoading; bool get isGetCurrentLocattion;
/// Create a copy of UpdateIncidentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateIncidentStateCopyWith<UpdateIncidentState> get copyWith => _$UpdateIncidentStateCopyWithImpl<UpdateIncidentState>(this as UpdateIncidentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateIncidentState&&(identical(other.stateController, stateController) || other.stateController == stateController)&&(identical(other.cityController, cityController) || other.cityController == cityController)&&(identical(other.addressController, addressController) || other.addressController == addressController)&&(identical(other.howToController, howToController) || other.howToController == howToController)&&(identical(other.updatedValue, updatedValue) || other.updatedValue == updatedValue)&&(identical(other.updatedPlaceValue, updatedPlaceValue) || other.updatedPlaceValue == updatedPlaceValue)&&(identical(other.updateError, updateError) || other.updateError == updateError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorUpdateStatusMessage, errorUpdateStatusMessage) || other.errorUpdateStatusMessage == errorUpdateStatusMessage)&&(identical(other.updatedSuccessfully, updatedSuccessfully) || other.updatedSuccessfully == updatedSuccessfully)&&(identical(other.deletedSuccessfully, deletedSuccessfully) || other.deletedSuccessfully == deletedSuccessfully)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isGetCurrentLocattion, isGetCurrentLocattion) || other.isGetCurrentLocattion == isGetCurrentLocattion));
}


@override
int get hashCode => Object.hash(runtimeType,stateController,cityController,addressController,howToController,updatedValue,updatedPlaceValue,updateError,errorMessage,errorUpdateStatusMessage,updatedSuccessfully,deletedSuccessfully,isFormValid,isLoading,isGetCurrentLocattion);

@override
String toString() {
  return 'UpdateIncidentState(stateController: $stateController, cityController: $cityController, addressController: $addressController, howToController: $howToController, updatedValue: $updatedValue, updatedPlaceValue: $updatedPlaceValue, updateError: $updateError, errorMessage: $errorMessage, errorUpdateStatusMessage: $errorUpdateStatusMessage, updatedSuccessfully: $updatedSuccessfully, deletedSuccessfully: $deletedSuccessfully, isFormValid: $isFormValid, isLoading: $isLoading, isGetCurrentLocattion: $isGetCurrentLocattion)';
}


}

/// @nodoc
abstract mixin class $UpdateIncidentStateCopyWith<$Res>  {
  factory $UpdateIncidentStateCopyWith(UpdateIncidentState value, $Res Function(UpdateIncidentState) _then) = _$UpdateIncidentStateCopyWithImpl;
@useResult
$Res call({
 TextEditingController? stateController, TextEditingController? cityController, TextEditingController? addressController, TextEditingController? howToController, IncidentOutput? updatedValue, String? updatedPlaceValue, String? updateError, String? errorMessage, String? errorUpdateStatusMessage, bool updatedSuccessfully, bool deletedSuccessfully, bool isFormValid, bool isLoading, bool isGetCurrentLocattion
});


$IncidentOutputCopyWith<$Res>? get updatedValue;

}
/// @nodoc
class _$UpdateIncidentStateCopyWithImpl<$Res>
    implements $UpdateIncidentStateCopyWith<$Res> {
  _$UpdateIncidentStateCopyWithImpl(this._self, this._then);

  final UpdateIncidentState _self;
  final $Res Function(UpdateIncidentState) _then;

/// Create a copy of UpdateIncidentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stateController = freezed,Object? cityController = freezed,Object? addressController = freezed,Object? howToController = freezed,Object? updatedValue = freezed,Object? updatedPlaceValue = freezed,Object? updateError = freezed,Object? errorMessage = freezed,Object? errorUpdateStatusMessage = freezed,Object? updatedSuccessfully = null,Object? deletedSuccessfully = null,Object? isFormValid = null,Object? isLoading = null,Object? isGetCurrentLocattion = null,}) {
  return _then(_self.copyWith(
stateController: freezed == stateController ? _self.stateController : stateController // ignore: cast_nullable_to_non_nullable
as TextEditingController?,cityController: freezed == cityController ? _self.cityController : cityController // ignore: cast_nullable_to_non_nullable
as TextEditingController?,addressController: freezed == addressController ? _self.addressController : addressController // ignore: cast_nullable_to_non_nullable
as TextEditingController?,howToController: freezed == howToController ? _self.howToController : howToController // ignore: cast_nullable_to_non_nullable
as TextEditingController?,updatedValue: freezed == updatedValue ? _self.updatedValue : updatedValue // ignore: cast_nullable_to_non_nullable
as IncidentOutput?,updatedPlaceValue: freezed == updatedPlaceValue ? _self.updatedPlaceValue : updatedPlaceValue // ignore: cast_nullable_to_non_nullable
as String?,updateError: freezed == updateError ? _self.updateError : updateError // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorUpdateStatusMessage: freezed == errorUpdateStatusMessage ? _self.errorUpdateStatusMessage : errorUpdateStatusMessage // ignore: cast_nullable_to_non_nullable
as String?,updatedSuccessfully: null == updatedSuccessfully ? _self.updatedSuccessfully : updatedSuccessfully // ignore: cast_nullable_to_non_nullable
as bool,deletedSuccessfully: null == deletedSuccessfully ? _self.deletedSuccessfully : deletedSuccessfully // ignore: cast_nullable_to_non_nullable
as bool,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isGetCurrentLocattion: null == isGetCurrentLocattion ? _self.isGetCurrentLocattion : isGetCurrentLocattion // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of UpdateIncidentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IncidentOutputCopyWith<$Res>? get updatedValue {
    if (_self.updatedValue == null) {
    return null;
  }

  return $IncidentOutputCopyWith<$Res>(_self.updatedValue!, (value) {
    return _then(_self.copyWith(updatedValue: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateIncidentState].
extension UpdateIncidentStatePatterns on UpdateIncidentState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateIncidentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateIncidentState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateIncidentState value)  $default,){
final _that = this;
switch (_that) {
case _UpdateIncidentState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateIncidentState value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateIncidentState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TextEditingController? stateController,  TextEditingController? cityController,  TextEditingController? addressController,  TextEditingController? howToController,  IncidentOutput? updatedValue,  String? updatedPlaceValue,  String? updateError,  String? errorMessage,  String? errorUpdateStatusMessage,  bool updatedSuccessfully,  bool deletedSuccessfully,  bool isFormValid,  bool isLoading,  bool isGetCurrentLocattion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateIncidentState() when $default != null:
return $default(_that.stateController,_that.cityController,_that.addressController,_that.howToController,_that.updatedValue,_that.updatedPlaceValue,_that.updateError,_that.errorMessage,_that.errorUpdateStatusMessage,_that.updatedSuccessfully,_that.deletedSuccessfully,_that.isFormValid,_that.isLoading,_that.isGetCurrentLocattion);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TextEditingController? stateController,  TextEditingController? cityController,  TextEditingController? addressController,  TextEditingController? howToController,  IncidentOutput? updatedValue,  String? updatedPlaceValue,  String? updateError,  String? errorMessage,  String? errorUpdateStatusMessage,  bool updatedSuccessfully,  bool deletedSuccessfully,  bool isFormValid,  bool isLoading,  bool isGetCurrentLocattion)  $default,) {final _that = this;
switch (_that) {
case _UpdateIncidentState():
return $default(_that.stateController,_that.cityController,_that.addressController,_that.howToController,_that.updatedValue,_that.updatedPlaceValue,_that.updateError,_that.errorMessage,_that.errorUpdateStatusMessage,_that.updatedSuccessfully,_that.deletedSuccessfully,_that.isFormValid,_that.isLoading,_that.isGetCurrentLocattion);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TextEditingController? stateController,  TextEditingController? cityController,  TextEditingController? addressController,  TextEditingController? howToController,  IncidentOutput? updatedValue,  String? updatedPlaceValue,  String? updateError,  String? errorMessage,  String? errorUpdateStatusMessage,  bool updatedSuccessfully,  bool deletedSuccessfully,  bool isFormValid,  bool isLoading,  bool isGetCurrentLocattion)?  $default,) {final _that = this;
switch (_that) {
case _UpdateIncidentState() when $default != null:
return $default(_that.stateController,_that.cityController,_that.addressController,_that.howToController,_that.updatedValue,_that.updatedPlaceValue,_that.updateError,_that.errorMessage,_that.errorUpdateStatusMessage,_that.updatedSuccessfully,_that.deletedSuccessfully,_that.isFormValid,_that.isLoading,_that.isGetCurrentLocattion);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateIncidentState implements UpdateIncidentState {
  const _UpdateIncidentState({this.stateController, this.cityController, this.addressController, this.howToController, this.updatedValue, this.updatedPlaceValue, this.updateError, this.errorMessage, this.errorUpdateStatusMessage, this.updatedSuccessfully = false, this.deletedSuccessfully = false, this.isFormValid = false, this.isLoading = false, this.isGetCurrentLocattion = false});
  

@override final  TextEditingController? stateController;
@override final  TextEditingController? cityController;
@override final  TextEditingController? addressController;
@override final  TextEditingController? howToController;
@override final  IncidentOutput? updatedValue;
@override final  String? updatedPlaceValue;
@override final  String? updateError;
@override final  String? errorMessage;
@override final  String? errorUpdateStatusMessage;
@override@JsonKey() final  bool updatedSuccessfully;
@override@JsonKey() final  bool deletedSuccessfully;
@override@JsonKey() final  bool isFormValid;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isGetCurrentLocattion;

/// Create a copy of UpdateIncidentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateIncidentStateCopyWith<_UpdateIncidentState> get copyWith => __$UpdateIncidentStateCopyWithImpl<_UpdateIncidentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateIncidentState&&(identical(other.stateController, stateController) || other.stateController == stateController)&&(identical(other.cityController, cityController) || other.cityController == cityController)&&(identical(other.addressController, addressController) || other.addressController == addressController)&&(identical(other.howToController, howToController) || other.howToController == howToController)&&(identical(other.updatedValue, updatedValue) || other.updatedValue == updatedValue)&&(identical(other.updatedPlaceValue, updatedPlaceValue) || other.updatedPlaceValue == updatedPlaceValue)&&(identical(other.updateError, updateError) || other.updateError == updateError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorUpdateStatusMessage, errorUpdateStatusMessage) || other.errorUpdateStatusMessage == errorUpdateStatusMessage)&&(identical(other.updatedSuccessfully, updatedSuccessfully) || other.updatedSuccessfully == updatedSuccessfully)&&(identical(other.deletedSuccessfully, deletedSuccessfully) || other.deletedSuccessfully == deletedSuccessfully)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isGetCurrentLocattion, isGetCurrentLocattion) || other.isGetCurrentLocattion == isGetCurrentLocattion));
}


@override
int get hashCode => Object.hash(runtimeType,stateController,cityController,addressController,howToController,updatedValue,updatedPlaceValue,updateError,errorMessage,errorUpdateStatusMessage,updatedSuccessfully,deletedSuccessfully,isFormValid,isLoading,isGetCurrentLocattion);

@override
String toString() {
  return 'UpdateIncidentState(stateController: $stateController, cityController: $cityController, addressController: $addressController, howToController: $howToController, updatedValue: $updatedValue, updatedPlaceValue: $updatedPlaceValue, updateError: $updateError, errorMessage: $errorMessage, errorUpdateStatusMessage: $errorUpdateStatusMessage, updatedSuccessfully: $updatedSuccessfully, deletedSuccessfully: $deletedSuccessfully, isFormValid: $isFormValid, isLoading: $isLoading, isGetCurrentLocattion: $isGetCurrentLocattion)';
}


}

/// @nodoc
abstract mixin class _$UpdateIncidentStateCopyWith<$Res> implements $UpdateIncidentStateCopyWith<$Res> {
  factory _$UpdateIncidentStateCopyWith(_UpdateIncidentState value, $Res Function(_UpdateIncidentState) _then) = __$UpdateIncidentStateCopyWithImpl;
@override @useResult
$Res call({
 TextEditingController? stateController, TextEditingController? cityController, TextEditingController? addressController, TextEditingController? howToController, IncidentOutput? updatedValue, String? updatedPlaceValue, String? updateError, String? errorMessage, String? errorUpdateStatusMessage, bool updatedSuccessfully, bool deletedSuccessfully, bool isFormValid, bool isLoading, bool isGetCurrentLocattion
});


@override $IncidentOutputCopyWith<$Res>? get updatedValue;

}
/// @nodoc
class __$UpdateIncidentStateCopyWithImpl<$Res>
    implements _$UpdateIncidentStateCopyWith<$Res> {
  __$UpdateIncidentStateCopyWithImpl(this._self, this._then);

  final _UpdateIncidentState _self;
  final $Res Function(_UpdateIncidentState) _then;

/// Create a copy of UpdateIncidentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stateController = freezed,Object? cityController = freezed,Object? addressController = freezed,Object? howToController = freezed,Object? updatedValue = freezed,Object? updatedPlaceValue = freezed,Object? updateError = freezed,Object? errorMessage = freezed,Object? errorUpdateStatusMessage = freezed,Object? updatedSuccessfully = null,Object? deletedSuccessfully = null,Object? isFormValid = null,Object? isLoading = null,Object? isGetCurrentLocattion = null,}) {
  return _then(_UpdateIncidentState(
stateController: freezed == stateController ? _self.stateController : stateController // ignore: cast_nullable_to_non_nullable
as TextEditingController?,cityController: freezed == cityController ? _self.cityController : cityController // ignore: cast_nullable_to_non_nullable
as TextEditingController?,addressController: freezed == addressController ? _self.addressController : addressController // ignore: cast_nullable_to_non_nullable
as TextEditingController?,howToController: freezed == howToController ? _self.howToController : howToController // ignore: cast_nullable_to_non_nullable
as TextEditingController?,updatedValue: freezed == updatedValue ? _self.updatedValue : updatedValue // ignore: cast_nullable_to_non_nullable
as IncidentOutput?,updatedPlaceValue: freezed == updatedPlaceValue ? _self.updatedPlaceValue : updatedPlaceValue // ignore: cast_nullable_to_non_nullable
as String?,updateError: freezed == updateError ? _self.updateError : updateError // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorUpdateStatusMessage: freezed == errorUpdateStatusMessage ? _self.errorUpdateStatusMessage : errorUpdateStatusMessage // ignore: cast_nullable_to_non_nullable
as String?,updatedSuccessfully: null == updatedSuccessfully ? _self.updatedSuccessfully : updatedSuccessfully // ignore: cast_nullable_to_non_nullable
as bool,deletedSuccessfully: null == deletedSuccessfully ? _self.deletedSuccessfully : deletedSuccessfully // ignore: cast_nullable_to_non_nullable
as bool,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isGetCurrentLocattion: null == isGetCurrentLocattion ? _self.isGetCurrentLocattion : isGetCurrentLocattion // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of UpdateIncidentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IncidentOutputCopyWith<$Res>? get updatedValue {
    if (_self.updatedValue == null) {
    return null;
  }

  return $IncidentOutputCopyWith<$Res>(_self.updatedValue!, (value) {
    return _then(_self.copyWith(updatedValue: value));
  });
}
}

// dart format on
