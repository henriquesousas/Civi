// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_update_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemUpdateState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ItemUpdateState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ItemUpdateState()';
  }
}

/// @nodoc
class $ItemUpdateStateCopyWith<$Res> {
  $ItemUpdateStateCopyWith(
      ItemUpdateState _, $Res Function(ItemUpdateState) __);
}

/// Adds pattern-matching-related methods to [ItemUpdateState].
extension ItemUpdateStatePatterns on ItemUpdateState {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ItemUpdateStateInitial value)? initial,
    TResult Function(_ItemUpdateStateLoad value)? load,
    TResult Function(_ItemUpdateStateChangeModel value)? changeModel,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ItemUpdateStateInitial() when initial != null:
        return initial(_that);
      case _ItemUpdateStateLoad() when load != null:
        return load(_that);
      case _ItemUpdateStateChangeModel() when changeModel != null:
        return changeModel(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ItemUpdateStateInitial value) initial,
    required TResult Function(_ItemUpdateStateLoad value) load,
    required TResult Function(_ItemUpdateStateChangeModel value) changeModel,
  }) {
    final _that = this;
    switch (_that) {
      case _ItemUpdateStateInitial():
        return initial(_that);
      case _ItemUpdateStateLoad():
        return load(_that);
      case _ItemUpdateStateChangeModel():
        return changeModel(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ItemUpdateStateInitial value)? initial,
    TResult? Function(_ItemUpdateStateLoad value)? load,
    TResult? Function(_ItemUpdateStateChangeModel value)? changeModel,
  }) {
    final _that = this;
    switch (_that) {
      case _ItemUpdateStateInitial() when initial != null:
        return initial(_that);
      case _ItemUpdateStateLoad() when load != null:
        return load(_that);
      case _ItemUpdateStateChangeModel() when changeModel != null:
        return changeModel(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Item tem)? load,
    TResult Function(String value)? changeModel,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ItemUpdateStateInitial() when initial != null:
        return initial();
      case _ItemUpdateStateLoad() when load != null:
        return load(_that.tem);
      case _ItemUpdateStateChangeModel() when changeModel != null:
        return changeModel(_that.value);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Item tem) load,
    required TResult Function(String value) changeModel,
  }) {
    final _that = this;
    switch (_that) {
      case _ItemUpdateStateInitial():
        return initial();
      case _ItemUpdateStateLoad():
        return load(_that.tem);
      case _ItemUpdateStateChangeModel():
        return changeModel(_that.value);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Item tem)? load,
    TResult? Function(String value)? changeModel,
  }) {
    final _that = this;
    switch (_that) {
      case _ItemUpdateStateInitial() when initial != null:
        return initial();
      case _ItemUpdateStateLoad() when load != null:
        return load(_that.tem);
      case _ItemUpdateStateChangeModel() when changeModel != null:
        return changeModel(_that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ItemUpdateStateInitial implements ItemUpdateState {
  const _ItemUpdateStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ItemUpdateStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ItemUpdateState.initial()';
  }
}

/// @nodoc

class _ItemUpdateStateLoad implements ItemUpdateState {
  const _ItemUpdateStateLoad(this.tem);

  final Item tem;

  /// Create a copy of ItemUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemUpdateStateLoadCopyWith<_ItemUpdateStateLoad> get copyWith =>
      __$ItemUpdateStateLoadCopyWithImpl<_ItemUpdateStateLoad>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemUpdateStateLoad &&
            (identical(other.tem, tem) || other.tem == tem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tem);

  @override
  String toString() {
    return 'ItemUpdateState.load(tem: $tem)';
  }
}

/// @nodoc
abstract mixin class _$ItemUpdateStateLoadCopyWith<$Res>
    implements $ItemUpdateStateCopyWith<$Res> {
  factory _$ItemUpdateStateLoadCopyWith(_ItemUpdateStateLoad value,
          $Res Function(_ItemUpdateStateLoad) _then) =
      __$ItemUpdateStateLoadCopyWithImpl;
  @useResult
  $Res call({Item tem});
}

/// @nodoc
class __$ItemUpdateStateLoadCopyWithImpl<$Res>
    implements _$ItemUpdateStateLoadCopyWith<$Res> {
  __$ItemUpdateStateLoadCopyWithImpl(this._self, this._then);

  final _ItemUpdateStateLoad _self;
  final $Res Function(_ItemUpdateStateLoad) _then;

  /// Create a copy of ItemUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tem = null,
  }) {
    return _then(_ItemUpdateStateLoad(
      null == tem
          ? _self.tem
          : tem // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }
}

/// @nodoc

class _ItemUpdateStateChangeModel implements ItemUpdateState {
  const _ItemUpdateStateChangeModel(this.value);

  final String value;

  /// Create a copy of ItemUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemUpdateStateChangeModelCopyWith<_ItemUpdateStateChangeModel>
      get copyWith => __$ItemUpdateStateChangeModelCopyWithImpl<
          _ItemUpdateStateChangeModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemUpdateStateChangeModel &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ItemUpdateState.changeModel(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$ItemUpdateStateChangeModelCopyWith<$Res>
    implements $ItemUpdateStateCopyWith<$Res> {
  factory _$ItemUpdateStateChangeModelCopyWith(
          _ItemUpdateStateChangeModel value,
          $Res Function(_ItemUpdateStateChangeModel) _then) =
      __$ItemUpdateStateChangeModelCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$ItemUpdateStateChangeModelCopyWithImpl<$Res>
    implements _$ItemUpdateStateChangeModelCopyWith<$Res> {
  __$ItemUpdateStateChangeModelCopyWithImpl(this._self, this._then);

  final _ItemUpdateStateChangeModel _self;
  final $Res Function(_ItemUpdateStateChangeModel) _then;

  /// Create a copy of ItemUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_ItemUpdateStateChangeModel(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
