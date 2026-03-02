// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationState()';
  }
}

/// @nodoc
class $LocationStateCopyWith<$Res> {
  $LocationStateCopyWith(LocationState _, $Res Function(LocationState) __);
}

/// Adds pattern-matching-related methods to [LocationState].
extension LocationStatePatterns on LocationState {
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Granted value)? granted,
    TResult Function(_ServiceDisabled value)? serviceDisabled,
    TResult Function(_Checking value)? checking,
    TResult Function(_Denied value)? denied,
    TResult Function(_DeniedPermanently value)? deniedPermanently,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Loading() when loading != null:
        return loading(_that);
      case _Granted() when granted != null:
        return granted(_that);
      case _ServiceDisabled() when serviceDisabled != null:
        return serviceDisabled(_that);
      case _Checking() when checking != null:
        return checking(_that);
      case _Denied() when denied != null:
        return denied(_that);
      case _DeniedPermanently() when deniedPermanently != null:
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Granted value) granted,
    required TResult Function(_ServiceDisabled value) serviceDisabled,
    required TResult Function(_Checking value) checking,
    required TResult Function(_Denied value) denied,
    required TResult Function(_DeniedPermanently value) deniedPermanently,
  }) {
    final _that = this;
    switch (_that) {
      case _Loading():
        return loading(_that);
      case _Granted():
        return granted(_that);
      case _ServiceDisabled():
        return serviceDisabled(_that);
      case _Checking():
        return checking(_that);
      case _Denied():
        return denied(_that);
      case _DeniedPermanently():
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Granted value)? granted,
    TResult? Function(_ServiceDisabled value)? serviceDisabled,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_Denied value)? denied,
    TResult? Function(_DeniedPermanently value)? deniedPermanently,
  }) {
    final _that = this;
    switch (_that) {
      case _Loading() when loading != null:
        return loading(_that);
      case _Granted() when granted != null:
        return granted(_that);
      case _ServiceDisabled() when serviceDisabled != null:
        return serviceDisabled(_that);
      case _Checking() when checking != null:
        return checking(_that);
      case _Denied() when denied != null:
        return denied(_that);
      case _DeniedPermanently() when deniedPermanently != null:
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
    TResult Function(OldCurrentLocation? location)? granted,
    TResult Function()? serviceDisabled,
    TResult Function()? checking,
    TResult Function()? denied,
    TResult Function()? deniedPermanently,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Loading() when loading != null:
        return loading();
      case _Granted() when granted != null:
        return granted(_that.location);
      case _ServiceDisabled() when serviceDisabled != null:
        return serviceDisabled();
      case _Checking() when checking != null:
        return checking();
      case _Denied() when denied != null:
        return denied();
      case _DeniedPermanently() when deniedPermanently != null:
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
    required TResult Function(OldCurrentLocation? location) granted,
    required TResult Function() serviceDisabled,
    required TResult Function() checking,
    required TResult Function() denied,
    required TResult Function() deniedPermanently,
  }) {
    final _that = this;
    switch (_that) {
      case _Loading():
        return loading();
      case _Granted():
        return granted(_that.location);
      case _ServiceDisabled():
        return serviceDisabled();
      case _Checking():
        return checking();
      case _Denied():
        return denied();
      case _DeniedPermanently():
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
    TResult? Function(OldCurrentLocation? location)? granted,
    TResult? Function()? serviceDisabled,
    TResult? Function()? checking,
    TResult? Function()? denied,
    TResult? Function()? deniedPermanently,
  }) {
    final _that = this;
    switch (_that) {
      case _Loading() when loading != null:
        return loading();
      case _Granted() when granted != null:
        return granted(_that.location);
      case _ServiceDisabled() when serviceDisabled != null:
        return serviceDisabled();
      case _Checking() when checking != null:
        return checking();
      case _Denied() when denied != null:
        return denied();
      case _DeniedPermanently() when deniedPermanently != null:
        return deniedPermanently();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Loading implements LocationState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationState.loading()';
  }
}

/// @nodoc

class _Granted implements LocationState {
  const _Granted(this.location);

  final OldCurrentLocation? location;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GrantedCopyWith<_Granted> get copyWith =>
      __$GrantedCopyWithImpl<_Granted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Granted &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, location);

  @override
  String toString() {
    return 'LocationState.granted(location: $location)';
  }
}

/// @nodoc
abstract mixin class _$GrantedCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$GrantedCopyWith(_Granted value, $Res Function(_Granted) _then) =
      __$GrantedCopyWithImpl;
  @useResult
  $Res call({OldCurrentLocation? location});
}

/// @nodoc
class __$GrantedCopyWithImpl<$Res> implements _$GrantedCopyWith<$Res> {
  __$GrantedCopyWithImpl(this._self, this._then);

  final _Granted _self;
  final $Res Function(_Granted) _then;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? location = freezed,
  }) {
    return _then(_Granted(
      freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as OldCurrentLocation?,
    ));
  }
}

/// @nodoc

class _ServiceDisabled implements LocationState {
  const _ServiceDisabled();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ServiceDisabled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationState.serviceDisabled()';
  }
}

/// @nodoc

class _Checking implements LocationState {
  const _Checking();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Checking);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationState.checking()';
  }
}

/// @nodoc

class _Denied implements LocationState {
  const _Denied();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Denied);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationState.denied()';
  }
}

/// @nodoc

class _DeniedPermanently implements LocationState {
  const _DeniedPermanently();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DeniedPermanently);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationState.deniedPermanently()';
  }
}

// dart format on
