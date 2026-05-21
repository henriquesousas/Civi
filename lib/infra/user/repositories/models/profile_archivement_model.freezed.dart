// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_archivement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileArchivementModel {

 String get code; String get name;
/// Create a copy of ProfileArchivementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileArchivementModelCopyWith<ProfileArchivementModel> get copyWith => _$ProfileArchivementModelCopyWithImpl<ProfileArchivementModel>(this as ProfileArchivementModel, _$identity);

  /// Serializes this ProfileArchivementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileArchivementModel&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name);

@override
String toString() {
  return 'ProfileArchivementModel(code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class $ProfileArchivementModelCopyWith<$Res>  {
  factory $ProfileArchivementModelCopyWith(ProfileArchivementModel value, $Res Function(ProfileArchivementModel) _then) = _$ProfileArchivementModelCopyWithImpl;
@useResult
$Res call({
 String code, String name
});




}
/// @nodoc
class _$ProfileArchivementModelCopyWithImpl<$Res>
    implements $ProfileArchivementModelCopyWith<$Res> {
  _$ProfileArchivementModelCopyWithImpl(this._self, this._then);

  final ProfileArchivementModel _self;
  final $Res Function(ProfileArchivementModel) _then;

/// Create a copy of ProfileArchivementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileArchivementModel].
extension ProfileArchivementModelPatterns on ProfileArchivementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileArchivementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileArchivementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileArchivementModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileArchivementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileArchivementModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileArchivementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileArchivementModel() when $default != null:
return $default(_that.code,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name)  $default,) {final _that = this;
switch (_that) {
case _ProfileArchivementModel():
return $default(_that.code,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name)?  $default,) {final _that = this;
switch (_that) {
case _ProfileArchivementModel() when $default != null:
return $default(_that.code,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileArchivementModel implements ProfileArchivementModel {
   _ProfileArchivementModel({required this.code, required this.name});
  factory _ProfileArchivementModel.fromJson(Map<String, dynamic> json) => _$ProfileArchivementModelFromJson(json);

@override final  String code;
@override final  String name;

/// Create a copy of ProfileArchivementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileArchivementModelCopyWith<_ProfileArchivementModel> get copyWith => __$ProfileArchivementModelCopyWithImpl<_ProfileArchivementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileArchivementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileArchivementModel&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name);

@override
String toString() {
  return 'ProfileArchivementModel(code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ProfileArchivementModelCopyWith<$Res> implements $ProfileArchivementModelCopyWith<$Res> {
  factory _$ProfileArchivementModelCopyWith(_ProfileArchivementModel value, $Res Function(_ProfileArchivementModel) _then) = __$ProfileArchivementModelCopyWithImpl;
@override @useResult
$Res call({
 String code, String name
});




}
/// @nodoc
class __$ProfileArchivementModelCopyWithImpl<$Res>
    implements _$ProfileArchivementModelCopyWith<$Res> {
  __$ProfileArchivementModelCopyWithImpl(this._self, this._then);

  final _ProfileArchivementModel _self;
  final $Res Function(_ProfileArchivementModel) _then;

/// Create a copy of ProfileArchivementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,}) {
  return _then(_ProfileArchivementModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
