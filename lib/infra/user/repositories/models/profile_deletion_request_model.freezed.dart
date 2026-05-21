// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_deletion_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileDeletionRequestModel {

 String get id; String get status; String get reason;@JsonKey(name: "requested_at") DateTime get requestedAt;@JsonKey(name: "processed_at") DateTime? get processedAt;
/// Create a copy of ProfileDeletionRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDeletionRequestModelCopyWith<ProfileDeletionRequestModel> get copyWith => _$ProfileDeletionRequestModelCopyWithImpl<ProfileDeletionRequestModel>(this as ProfileDeletionRequestModel, _$identity);

  /// Serializes this ProfileDeletionRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDeletionRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.processedAt, processedAt) || other.processedAt == processedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,reason,requestedAt,processedAt);

@override
String toString() {
  return 'ProfileDeletionRequestModel(id: $id, status: $status, reason: $reason, requestedAt: $requestedAt, processedAt: $processedAt)';
}


}

/// @nodoc
abstract mixin class $ProfileDeletionRequestModelCopyWith<$Res>  {
  factory $ProfileDeletionRequestModelCopyWith(ProfileDeletionRequestModel value, $Res Function(ProfileDeletionRequestModel) _then) = _$ProfileDeletionRequestModelCopyWithImpl;
@useResult
$Res call({
 String id, String status, String reason,@JsonKey(name: "requested_at") DateTime requestedAt,@JsonKey(name: "processed_at") DateTime? processedAt
});




}
/// @nodoc
class _$ProfileDeletionRequestModelCopyWithImpl<$Res>
    implements $ProfileDeletionRequestModelCopyWith<$Res> {
  _$ProfileDeletionRequestModelCopyWithImpl(this._self, this._then);

  final ProfileDeletionRequestModel _self;
  final $Res Function(ProfileDeletionRequestModel) _then;

/// Create a copy of ProfileDeletionRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? reason = null,Object? requestedAt = null,Object? processedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,processedAt: freezed == processedAt ? _self.processedAt : processedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileDeletionRequestModel].
extension ProfileDeletionRequestModelPatterns on ProfileDeletionRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDeletionRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDeletionRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDeletionRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDeletionRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDeletionRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDeletionRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status,  String reason, @JsonKey(name: "requested_at")  DateTime requestedAt, @JsonKey(name: "processed_at")  DateTime? processedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDeletionRequestModel() when $default != null:
return $default(_that.id,_that.status,_that.reason,_that.requestedAt,_that.processedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status,  String reason, @JsonKey(name: "requested_at")  DateTime requestedAt, @JsonKey(name: "processed_at")  DateTime? processedAt)  $default,) {final _that = this;
switch (_that) {
case _ProfileDeletionRequestModel():
return $default(_that.id,_that.status,_that.reason,_that.requestedAt,_that.processedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status,  String reason, @JsonKey(name: "requested_at")  DateTime requestedAt, @JsonKey(name: "processed_at")  DateTime? processedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDeletionRequestModel() when $default != null:
return $default(_that.id,_that.status,_that.reason,_that.requestedAt,_that.processedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileDeletionRequestModel implements ProfileDeletionRequestModel {
   _ProfileDeletionRequestModel({required this.id, required this.status, required this.reason, @JsonKey(name: "requested_at") required this.requestedAt, @JsonKey(name: "processed_at") required this.processedAt});
  factory _ProfileDeletionRequestModel.fromJson(Map<String, dynamic> json) => _$ProfileDeletionRequestModelFromJson(json);

@override final  String id;
@override final  String status;
@override final  String reason;
@override@JsonKey(name: "requested_at") final  DateTime requestedAt;
@override@JsonKey(name: "processed_at") final  DateTime? processedAt;

/// Create a copy of ProfileDeletionRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDeletionRequestModelCopyWith<_ProfileDeletionRequestModel> get copyWith => __$ProfileDeletionRequestModelCopyWithImpl<_ProfileDeletionRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDeletionRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDeletionRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.processedAt, processedAt) || other.processedAt == processedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,reason,requestedAt,processedAt);

@override
String toString() {
  return 'ProfileDeletionRequestModel(id: $id, status: $status, reason: $reason, requestedAt: $requestedAt, processedAt: $processedAt)';
}


}

/// @nodoc
abstract mixin class _$ProfileDeletionRequestModelCopyWith<$Res> implements $ProfileDeletionRequestModelCopyWith<$Res> {
  factory _$ProfileDeletionRequestModelCopyWith(_ProfileDeletionRequestModel value, $Res Function(_ProfileDeletionRequestModel) _then) = __$ProfileDeletionRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String status, String reason,@JsonKey(name: "requested_at") DateTime requestedAt,@JsonKey(name: "processed_at") DateTime? processedAt
});




}
/// @nodoc
class __$ProfileDeletionRequestModelCopyWithImpl<$Res>
    implements _$ProfileDeletionRequestModelCopyWith<$Res> {
  __$ProfileDeletionRequestModelCopyWithImpl(this._self, this._then);

  final _ProfileDeletionRequestModel _self;
  final $Res Function(_ProfileDeletionRequestModel) _then;

/// Create a copy of ProfileDeletionRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? reason = null,Object? requestedAt = null,Object? processedAt = freezed,}) {
  return _then(_ProfileDeletionRequestModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,processedAt: freezed == processedAt ? _self.processedAt : processedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
