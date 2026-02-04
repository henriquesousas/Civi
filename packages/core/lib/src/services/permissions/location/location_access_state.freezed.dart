// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_access_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationAccessState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocationAccessState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationAccessState()';
  }
}

/// @nodoc
class $LocationAccessStateCopyWith<$Res> {
  $LocationAccessStateCopyWith(
      LocationAccessState _, $Res Function(LocationAccessState) __);
}

/// Adds pattern-matching-related methods to [LocationAccessState].
extension LocationAccessStatePatterns on LocationAccessState {
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
    TResult Function(_StateLoading value)? loading,
    TResult Function(_StateGranted value)? granted,
    TResult Function(_StateServiceDisabled value)? serviceDisabled,
    TResult Function(_StateChecking value)? checking,
    TResult Function(_StateDenied value)? denied,
    TResult Function(_StateDeniedPermanently value)? deniedPermanently,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StateLoading() when loading != null:
        return loading(_that);
      case _StateGranted() when granted != null:
        return granted(_that);
      case _StateServiceDisabled() when serviceDisabled != null:
        return serviceDisabled(_that);
      case _StateChecking() when checking != null:
        return checking(_that);
      case _StateDenied() when denied != null:
        return denied(_that);
      case _StateDeniedPermanently() when deniedPermanently != null:
        return deniedPermanently(_that);
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
    required TResult Function(_StateLoading value) loading,
    required TResult Function(_StateGranted value) granted,
    required TResult Function(_StateServiceDisabled value) serviceDisabled,
    required TResult Function(_StateChecking value) checking,
    required TResult Function(_StateDenied value) denied,
    required TResult Function(_StateDeniedPermanently value) deniedPermanently,
  }) {
    final _that = this;
    switch (_that) {
      case _StateLoading():
        return loading(_that);
      case _StateGranted():
        return granted(_that);
      case _StateServiceDisabled():
        return serviceDisabled(_that);
      case _StateChecking():
        return checking(_that);
      case _StateDenied():
        return denied(_that);
      case _StateDeniedPermanently():
        return deniedPermanently(_that);
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
    TResult? Function(_StateLoading value)? loading,
    TResult? Function(_StateGranted value)? granted,
    TResult? Function(_StateServiceDisabled value)? serviceDisabled,
    TResult? Function(_StateChecking value)? checking,
    TResult? Function(_StateDenied value)? denied,
    TResult? Function(_StateDeniedPermanently value)? deniedPermanently,
  }) {
    final _that = this;
    switch (_that) {
      case _StateLoading() when loading != null:
        return loading(_that);
      case _StateGranted() when granted != null:
        return granted(_that);
      case _StateServiceDisabled() when serviceDisabled != null:
        return serviceDisabled(_that);
      case _StateChecking() when checking != null:
        return checking(_that);
      case _StateDenied() when denied != null:
        return denied(_that);
      case _StateDeniedPermanently() when deniedPermanently != null:
        return deniedPermanently(_that);
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
    TResult Function()? loading,
    TResult Function(CurrentLocation? location)? granted,
    TResult Function()? serviceDisabled,
    TResult Function()? checking,
    TResult Function()? denied,
    TResult Function()? deniedPermanently,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StateLoading() when loading != null:
        return loading();
      case _StateGranted() when granted != null:
        return granted(_that.location);
      case _StateServiceDisabled() when serviceDisabled != null:
        return serviceDisabled();
      case _StateChecking() when checking != null:
        return checking();
      case _StateDenied() when denied != null:
        return denied();
      case _StateDeniedPermanently() when deniedPermanently != null:
        return deniedPermanently();
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
    required TResult Function() loading,
    required TResult Function(CurrentLocation? location) granted,
    required TResult Function() serviceDisabled,
    required TResult Function() checking,
    required TResult Function() denied,
    required TResult Function() deniedPermanently,
  }) {
    final _that = this;
    switch (_that) {
      case _StateLoading():
        return loading();
      case _StateGranted():
        return granted(_that.location);
      case _StateServiceDisabled():
        return serviceDisabled();
      case _StateChecking():
        return checking();
      case _StateDenied():
        return denied();
      case _StateDeniedPermanently():
        return deniedPermanently();
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
    TResult? Function()? loading,
    TResult? Function(CurrentLocation? location)? granted,
    TResult? Function()? serviceDisabled,
    TResult? Function()? checking,
    TResult? Function()? denied,
    TResult? Function()? deniedPermanently,
  }) {
    final _that = this;
    switch (_that) {
      case _StateLoading() when loading != null:
        return loading();
      case _StateGranted() when granted != null:
        return granted(_that.location);
      case _StateServiceDisabled() when serviceDisabled != null:
        return serviceDisabled();
      case _StateChecking() when checking != null:
        return checking();
      case _StateDenied() when denied != null:
        return denied();
      case _StateDeniedPermanently() when deniedPermanently != null:
        return deniedPermanently();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StateLoading implements LocationAccessState {
  const _StateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _StateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationAccessState.loading()';
  }
}

/// @nodoc

class _StateGranted implements LocationAccessState {
  const _StateGranted(this.location);

  final CurrentLocation? location;

  /// Create a copy of LocationAccessState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StateGrantedCopyWith<_StateGranted> get copyWith =>
      __$StateGrantedCopyWithImpl<_StateGranted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StateGranted &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, location);

  @override
  String toString() {
    return 'LocationAccessState.granted(location: $location)';
  }
}

/// @nodoc
abstract mixin class _$StateGrantedCopyWith<$Res>
    implements $LocationAccessStateCopyWith<$Res> {
  factory _$StateGrantedCopyWith(
          _StateGranted value, $Res Function(_StateGranted) _then) =
      __$StateGrantedCopyWithImpl;
  @useResult
  $Res call({CurrentLocation? location});
}

/// @nodoc
class __$StateGrantedCopyWithImpl<$Res>
    implements _$StateGrantedCopyWith<$Res> {
  __$StateGrantedCopyWithImpl(this._self, this._then);

  final _StateGranted _self;
  final $Res Function(_StateGranted) _then;

  /// Create a copy of LocationAccessState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? location = freezed,
  }) {
    return _then(_StateGranted(
      freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as CurrentLocation?,
    ));
  }
}

/// @nodoc

class _StateServiceDisabled implements LocationAccessState {
  const _StateServiceDisabled();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _StateServiceDisabled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationAccessState.serviceDisabled()';
  }
}

/// @nodoc

class _StateChecking implements LocationAccessState {
  const _StateChecking();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _StateChecking);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationAccessState.checking()';
  }
}

/// @nodoc

class _StateDenied implements LocationAccessState {
  const _StateDenied();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _StateDenied);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationAccessState.denied()';
  }
}

/// @nodoc

class _StateDeniedPermanently implements LocationAccessState {
  const _StateDeniedPermanently();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _StateDeniedPermanently);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationAccessState.deniedPermanently()';
  }
}

// dart format on
