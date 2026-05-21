// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archivement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArchivementModel {

 String get id; String get name; String get code; String get description;@JsonKey(name: 'image_path') String get imagePath;
/// Create a copy of ArchivementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchivementModelCopyWith<ArchivementModel> get copyWith => _$ArchivementModelCopyWithImpl<ArchivementModel>(this as ArchivementModel, _$identity);

  /// Serializes this ArchivementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchivementModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,description,imagePath);

@override
String toString() {
  return 'ArchivementModel(id: $id, name: $name, code: $code, description: $description, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $ArchivementModelCopyWith<$Res>  {
  factory $ArchivementModelCopyWith(ArchivementModel value, $Res Function(ArchivementModel) _then) = _$ArchivementModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String code, String description,@JsonKey(name: 'image_path') String imagePath
});




}
/// @nodoc
class _$ArchivementModelCopyWithImpl<$Res>
    implements $ArchivementModelCopyWith<$Res> {
  _$ArchivementModelCopyWithImpl(this._self, this._then);

  final ArchivementModel _self;
  final $Res Function(ArchivementModel) _then;

/// Create a copy of ArchivementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? description = null,Object? imagePath = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ArchivementModel].
extension ArchivementModelPatterns on ArchivementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArchivementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArchivementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArchivementModel value)  $default,){
final _that = this;
switch (_that) {
case _ArchivementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArchivementModel value)?  $default,){
final _that = this;
switch (_that) {
case _ArchivementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String code,  String description, @JsonKey(name: 'image_path')  String imagePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArchivementModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.description,_that.imagePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String code,  String description, @JsonKey(name: 'image_path')  String imagePath)  $default,) {final _that = this;
switch (_that) {
case _ArchivementModel():
return $default(_that.id,_that.name,_that.code,_that.description,_that.imagePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String code,  String description, @JsonKey(name: 'image_path')  String imagePath)?  $default,) {final _that = this;
switch (_that) {
case _ArchivementModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.description,_that.imagePath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArchivementModel implements ArchivementModel {
   _ArchivementModel({required this.id, required this.name, required this.code, required this.description, @JsonKey(name: 'image_path') required this.imagePath});
  factory _ArchivementModel.fromJson(Map<String, dynamic> json) => _$ArchivementModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String code;
@override final  String description;
@override@JsonKey(name: 'image_path') final  String imagePath;

/// Create a copy of ArchivementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArchivementModelCopyWith<_ArchivementModel> get copyWith => __$ArchivementModelCopyWithImpl<_ArchivementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArchivementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArchivementModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,description,imagePath);

@override
String toString() {
  return 'ArchivementModel(id: $id, name: $name, code: $code, description: $description, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class _$ArchivementModelCopyWith<$Res> implements $ArchivementModelCopyWith<$Res> {
  factory _$ArchivementModelCopyWith(_ArchivementModel value, $Res Function(_ArchivementModel) _then) = __$ArchivementModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String code, String description,@JsonKey(name: 'image_path') String imagePath
});




}
/// @nodoc
class __$ArchivementModelCopyWithImpl<$Res>
    implements _$ArchivementModelCopyWith<$Res> {
  __$ArchivementModelCopyWithImpl(this._self, this._then);

  final _ArchivementModel _self;
  final $Res Function(_ArchivementModel) _then;

/// Create a copy of ArchivementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? description = null,Object? imagePath = null,}) {
  return _then(_ArchivementModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
