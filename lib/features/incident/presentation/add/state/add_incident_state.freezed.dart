// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_incident_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddIncidentState {
// @Default(false) bool isLoading,
// @Default(false) bool addingPhoto,
// @Default(false) bool deletingProduct,
// @Default(false) bool isSuccess,
// String? updateValue,
// String? errorValidation,
  Product? get product;
  TypeAlert get type;
  String? get errorMessage;

  /// Create a copy of AddIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddIncidentStateCopyWith<AddIncidentState> get copyWith =>
      _$AddIncidentStateCopyWithImpl<AddIncidentState>(
          this as AddIncidentState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddIncidentState &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, type, errorMessage);

  @override
  String toString() {
    return 'AddIncidentState(product: $product, type: $type, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $AddIncidentStateCopyWith<$Res> {
  factory $AddIncidentStateCopyWith(
          AddIncidentState value, $Res Function(AddIncidentState) _then) =
      _$AddIncidentStateCopyWithImpl;
  @useResult
  $Res call({Product? product, TypeAlert type, String? errorMessage});
}

/// @nodoc
class _$AddIncidentStateCopyWithImpl<$Res>
    implements $AddIncidentStateCopyWith<$Res> {
  _$AddIncidentStateCopyWithImpl(this._self, this._then);

  final AddIncidentState _self;
  final $Res Function(AddIncidentState) _then;

  /// Create a copy of AddIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? type = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      product: freezed == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeAlert,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AddIncidentState].
extension AddIncidentStatePatterns on AddIncidentState {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AddIncidentState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddIncidentState() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_AddIncidentState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddIncidentState():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AddIncidentState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddIncidentState() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Product? product, TypeAlert type, String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddIncidentState() when $default != null:
        return $default(_that.product, _that.type, _that.errorMessage);
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
  TResult when<TResult extends Object?>(
    TResult Function(Product? product, TypeAlert type, String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddIncidentState():
        return $default(_that.product, _that.type, _that.errorMessage);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Product? product, TypeAlert type, String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddIncidentState() when $default != null:
        return $default(_that.product, _that.type, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddIncidentState implements AddIncidentState {
  const _AddIncidentState(
      {this.product, this.type = TypeAlert.none, this.errorMessage});

// @Default(false) bool isLoading,
// @Default(false) bool addingPhoto,
// @Default(false) bool deletingProduct,
// @Default(false) bool isSuccess,
// String? updateValue,
// String? errorValidation,
  @override
  final Product? product;
  @override
  @JsonKey()
  final TypeAlert type;
  @override
  final String? errorMessage;

  /// Create a copy of AddIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddIncidentStateCopyWith<_AddIncidentState> get copyWith =>
      __$AddIncidentStateCopyWithImpl<_AddIncidentState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddIncidentState &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, type, errorMessage);

  @override
  String toString() {
    return 'AddIncidentState(product: $product, type: $type, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$AddIncidentStateCopyWith<$Res>
    implements $AddIncidentStateCopyWith<$Res> {
  factory _$AddIncidentStateCopyWith(
          _AddIncidentState value, $Res Function(_AddIncidentState) _then) =
      __$AddIncidentStateCopyWithImpl;
  @override
  @useResult
  $Res call({Product? product, TypeAlert type, String? errorMessage});
}

/// @nodoc
class __$AddIncidentStateCopyWithImpl<$Res>
    implements _$AddIncidentStateCopyWith<$Res> {
  __$AddIncidentStateCopyWithImpl(this._self, this._then);

  final _AddIncidentState _self;
  final $Res Function(_AddIncidentState) _then;

  /// Create a copy of AddIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = freezed,
    Object? type = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_AddIncidentState(
      product: freezed == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeAlert,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
