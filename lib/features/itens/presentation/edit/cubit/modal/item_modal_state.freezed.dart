// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_modal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemModalState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ItemModalState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ItemModalState()';
  }
}

/// @nodoc
class $ItemModalStateCopyWith<$Res> {
  $ItemModalStateCopyWith(ItemModalState _, $Res Function(ItemModalState) __);
}

/// Adds pattern-matching-related methods to [ItemModalState].
extension ItemModalStatePatterns on ItemModalState {
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
    TResult Function(_ItemModalStateInitial value)? initial,
    TResult Function(_ItemModalStateValidation value)? validation,
    TResult Function(_ItemModalStateSuccess value)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ItemModalStateInitial() when initial != null:
        return initial(_that);
      case _ItemModalStateValidation() when validation != null:
        return validation(_that);
      case _ItemModalStateSuccess() when success != null:
        return success(_that);
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
    required TResult Function(_ItemModalStateInitial value) initial,
    required TResult Function(_ItemModalStateValidation value) validation,
    required TResult Function(_ItemModalStateSuccess value) success,
  }) {
    final _that = this;
    switch (_that) {
      case _ItemModalStateInitial():
        return initial(_that);
      case _ItemModalStateValidation():
        return validation(_that);
      case _ItemModalStateSuccess():
        return success(_that);
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
    TResult? Function(_ItemModalStateInitial value)? initial,
    TResult? Function(_ItemModalStateValidation value)? validation,
    TResult? Function(_ItemModalStateSuccess value)? success,
  }) {
    final _that = this;
    switch (_that) {
      case _ItemModalStateInitial() when initial != null:
        return initial(_that);
      case _ItemModalStateValidation() when validation != null:
        return validation(_that);
      case _ItemModalStateSuccess() when success != null:
        return success(_that);
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
    TResult Function(String field, String? error)? validation,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ItemModalStateInitial() when initial != null:
        return initial();
      case _ItemModalStateValidation() when validation != null:
        return validation(_that.field, _that.error);
      case _ItemModalStateSuccess() when success != null:
        return success();
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
    required TResult Function(String field, String? error) validation,
    required TResult Function() success,
  }) {
    final _that = this;
    switch (_that) {
      case _ItemModalStateInitial():
        return initial();
      case _ItemModalStateValidation():
        return validation(_that.field, _that.error);
      case _ItemModalStateSuccess():
        return success();
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
    TResult? Function(String field, String? error)? validation,
    TResult? Function()? success,
  }) {
    final _that = this;
    switch (_that) {
      case _ItemModalStateInitial() when initial != null:
        return initial();
      case _ItemModalStateValidation() when validation != null:
        return validation(_that.field, _that.error);
      case _ItemModalStateSuccess() when success != null:
        return success();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ItemModalStateInitial implements ItemModalState {
  const _ItemModalStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ItemModalStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ItemModalState.initial()';
  }
}

/// @nodoc

class _ItemModalStateValidation implements ItemModalState {
  const _ItemModalStateValidation({required this.field, required this.error});

  final String field;
  final String? error;

  /// Create a copy of ItemModalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemModalStateValidationCopyWith<_ItemModalStateValidation> get copyWith =>
      __$ItemModalStateValidationCopyWithImpl<_ItemModalStateValidation>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemModalStateValidation &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field, error);

  @override
  String toString() {
    return 'ItemModalState.validation(field: $field, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$ItemModalStateValidationCopyWith<$Res>
    implements $ItemModalStateCopyWith<$Res> {
  factory _$ItemModalStateValidationCopyWith(_ItemModalStateValidation value,
          $Res Function(_ItemModalStateValidation) _then) =
      __$ItemModalStateValidationCopyWithImpl;
  @useResult
  $Res call({String field, String? error});
}

/// @nodoc
class __$ItemModalStateValidationCopyWithImpl<$Res>
    implements _$ItemModalStateValidationCopyWith<$Res> {
  __$ItemModalStateValidationCopyWithImpl(this._self, this._then);

  final _ItemModalStateValidation _self;
  final $Res Function(_ItemModalStateValidation) _then;

  /// Create a copy of ItemModalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field = null,
    Object? error = freezed,
  }) {
    return _then(_ItemModalStateValidation(
      field: null == field
          ? _self.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _ItemModalStateSuccess implements ItemModalState {
  const _ItemModalStateSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ItemModalStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ItemModalState.success()';
  }
}

// dart format on
