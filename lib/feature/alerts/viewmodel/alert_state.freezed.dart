// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlertState {
  CurrentLocation? get location;
  String? get errorMessage;
  dynamic get registeredsuccessfully;
  TypeAlert get type;
  bool get isLoading;
  String? get alertId;

  /// Create a copy of AlertState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AlertStateCopyWith<AlertState> get copyWith =>
      _$AlertStateCopyWithImpl<AlertState>(this as AlertState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AlertState &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other.registeredsuccessfully, registeredsuccessfully) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.alertId, alertId) || other.alertId == alertId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      location,
      errorMessage,
      const DeepCollectionEquality().hash(registeredsuccessfully),
      type,
      isLoading,
      alertId);

  @override
  String toString() {
    return 'AlertState(location: $location, errorMessage: $errorMessage, registeredsuccessfully: $registeredsuccessfully, type: $type, isLoading: $isLoading, alertId: $alertId)';
  }
}

/// @nodoc
abstract mixin class $AlertStateCopyWith<$Res> {
  factory $AlertStateCopyWith(
          AlertState value, $Res Function(AlertState) _then) =
      _$AlertStateCopyWithImpl;
  @useResult
  $Res call(
      {CurrentLocation? location,
      String? errorMessage,
      dynamic registeredsuccessfully,
      TypeAlert type,
      bool isLoading,
      String? alertId});
}

/// @nodoc
class _$AlertStateCopyWithImpl<$Res> implements $AlertStateCopyWith<$Res> {
  _$AlertStateCopyWithImpl(this._self, this._then);

  final AlertState _self;
  final $Res Function(AlertState) _then;

  /// Create a copy of AlertState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? errorMessage = freezed,
    Object? registeredsuccessfully = freezed,
    Object? type = null,
    Object? isLoading = null,
    Object? alertId = freezed,
  }) {
    return _then(_self.copyWith(
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as CurrentLocation?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      registeredsuccessfully: freezed == registeredsuccessfully
          ? _self.registeredsuccessfully
          : registeredsuccessfully // ignore: cast_nullable_to_non_nullable
              as dynamic,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeAlert,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      alertId: freezed == alertId
          ? _self.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AlertState].
extension AlertStatePatterns on AlertState {
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
    TResult Function(_AlertState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AlertState() when $default != null:
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
    TResult Function(_AlertState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AlertState():
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
    TResult? Function(_AlertState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AlertState() when $default != null:
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
    TResult Function(
            CurrentLocation? location,
            String? errorMessage,
            dynamic registeredsuccessfully,
            TypeAlert type,
            bool isLoading,
            String? alertId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AlertState() when $default != null:
        return $default(
            _that.location,
            _that.errorMessage,
            _that.registeredsuccessfully,
            _that.type,
            _that.isLoading,
            _that.alertId);
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
    TResult Function(
            CurrentLocation? location,
            String? errorMessage,
            dynamic registeredsuccessfully,
            TypeAlert type,
            bool isLoading,
            String? alertId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AlertState():
        return $default(
            _that.location,
            _that.errorMessage,
            _that.registeredsuccessfully,
            _that.type,
            _that.isLoading,
            _that.alertId);
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
    TResult? Function(
            CurrentLocation? location,
            String? errorMessage,
            dynamic registeredsuccessfully,
            TypeAlert type,
            bool isLoading,
            String? alertId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AlertState() when $default != null:
        return $default(
            _that.location,
            _that.errorMessage,
            _that.registeredsuccessfully,
            _that.type,
            _that.isLoading,
            _that.alertId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AlertState implements AlertState {
  const _AlertState(
      {this.location,
      this.errorMessage,
      this.registeredsuccessfully = false,
      this.type = TypeAlert.none,
      this.isLoading = false,
      this.alertId});

  @override
  final CurrentLocation? location;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final dynamic registeredsuccessfully;
  @override
  @JsonKey()
  final TypeAlert type;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? alertId;

  /// Create a copy of AlertState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AlertStateCopyWith<_AlertState> get copyWith =>
      __$AlertStateCopyWithImpl<_AlertState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlertState &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other.registeredsuccessfully, registeredsuccessfully) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.alertId, alertId) || other.alertId == alertId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      location,
      errorMessage,
      const DeepCollectionEquality().hash(registeredsuccessfully),
      type,
      isLoading,
      alertId);

  @override
  String toString() {
    return 'AlertState(location: $location, errorMessage: $errorMessage, registeredsuccessfully: $registeredsuccessfully, type: $type, isLoading: $isLoading, alertId: $alertId)';
  }
}

/// @nodoc
abstract mixin class _$AlertStateCopyWith<$Res>
    implements $AlertStateCopyWith<$Res> {
  factory _$AlertStateCopyWith(
          _AlertState value, $Res Function(_AlertState) _then) =
      __$AlertStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CurrentLocation? location,
      String? errorMessage,
      dynamic registeredsuccessfully,
      TypeAlert type,
      bool isLoading,
      String? alertId});
}

/// @nodoc
class __$AlertStateCopyWithImpl<$Res> implements _$AlertStateCopyWith<$Res> {
  __$AlertStateCopyWithImpl(this._self, this._then);

  final _AlertState _self;
  final $Res Function(_AlertState) _then;

  /// Create a copy of AlertState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? location = freezed,
    Object? errorMessage = freezed,
    Object? registeredsuccessfully = freezed,
    Object? type = null,
    Object? isLoading = null,
    Object? alertId = freezed,
  }) {
    return _then(_AlertState(
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as CurrentLocation?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      registeredsuccessfully: freezed == registeredsuccessfully
          ? _self.registeredsuccessfully
          : registeredsuccessfully // ignore: cast_nullable_to_non_nullable
              as dynamic,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeAlert,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      alertId: freezed == alertId
          ? _self.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
