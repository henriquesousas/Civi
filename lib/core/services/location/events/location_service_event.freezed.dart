// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_service_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationServiceEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocationServiceEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocationServiceEvent()';
  }
}

/// @nodoc
class $LocationServiceEventCopyWith<$Res> {
  $LocationServiceEventCopyWith(
      LocationServiceEvent _, $Res Function(LocationServiceEvent) __);
}

/// Adds pattern-matching-related methods to [LocationServiceEvent].
extension LocationServiceEventPatterns on LocationServiceEvent {
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
    TResult Function(_LocationServiceEventError value)? error,
    TResult Function(_LocationServiceEventSuccess value)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationServiceEventError() when error != null:
        return error(_that);
      case _LocationServiceEventSuccess() when success != null:
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
    required TResult Function(_LocationServiceEventError value) error,
    required TResult Function(_LocationServiceEventSuccess value) success,
  }) {
    final _that = this;
    switch (_that) {
      case _LocationServiceEventError():
        return error(_that);
      case _LocationServiceEventSuccess():
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
    TResult? Function(_LocationServiceEventError value)? error,
    TResult? Function(_LocationServiceEventSuccess value)? success,
  }) {
    final _that = this;
    switch (_that) {
      case _LocationServiceEventError() when error != null:
        return error(_that);
      case _LocationServiceEventSuccess() when success != null:
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
    TResult Function(LocationStatus status, String message, String title)?
        error,
    TResult Function(CurrentLocation? currentPlace)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationServiceEventError() when error != null:
        return error(_that.status, _that.message, _that.title);
      case _LocationServiceEventSuccess() when success != null:
        return success(_that.currentPlace);
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
    required TResult Function(
            LocationStatus status, String message, String title)
        error,
    required TResult Function(CurrentLocation? currentPlace) success,
  }) {
    final _that = this;
    switch (_that) {
      case _LocationServiceEventError():
        return error(_that.status, _that.message, _that.title);
      case _LocationServiceEventSuccess():
        return success(_that.currentPlace);
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
    TResult? Function(LocationStatus status, String message, String title)?
        error,
    TResult? Function(CurrentLocation? currentPlace)? success,
  }) {
    final _that = this;
    switch (_that) {
      case _LocationServiceEventError() when error != null:
        return error(_that.status, _that.message, _that.title);
      case _LocationServiceEventSuccess() when success != null:
        return success(_that.currentPlace);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LocationServiceEventError implements LocationServiceEvent {
  const _LocationServiceEventError(this.status, this.message, this.title);

  final LocationStatus status;
  final String message;
  final String title;

  /// Create a copy of LocationServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationServiceEventErrorCopyWith<_LocationServiceEventError>
      get copyWith =>
          __$LocationServiceEventErrorCopyWithImpl<_LocationServiceEventError>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationServiceEventError &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message, title);

  @override
  String toString() {
    return 'LocationServiceEvent.error(status: $status, message: $message, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$LocationServiceEventErrorCopyWith<$Res>
    implements $LocationServiceEventCopyWith<$Res> {
  factory _$LocationServiceEventErrorCopyWith(_LocationServiceEventError value,
          $Res Function(_LocationServiceEventError) _then) =
      __$LocationServiceEventErrorCopyWithImpl;
  @useResult
  $Res call({LocationStatus status, String message, String title});
}

/// @nodoc
class __$LocationServiceEventErrorCopyWithImpl<$Res>
    implements _$LocationServiceEventErrorCopyWith<$Res> {
  __$LocationServiceEventErrorCopyWithImpl(this._self, this._then);

  final _LocationServiceEventError _self;
  final $Res Function(_LocationServiceEventError) _then;

  /// Create a copy of LocationServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? title = null,
  }) {
    return _then(_LocationServiceEventError(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LocationStatus,
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _LocationServiceEventSuccess implements LocationServiceEvent {
  const _LocationServiceEventSuccess(this.currentPlace);

  final CurrentLocation? currentPlace;

  /// Create a copy of LocationServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationServiceEventSuccessCopyWith<_LocationServiceEventSuccess>
      get copyWith => __$LocationServiceEventSuccessCopyWithImpl<
          _LocationServiceEventSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationServiceEventSuccess &&
            (identical(other.currentPlace, currentPlace) ||
                other.currentPlace == currentPlace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPlace);

  @override
  String toString() {
    return 'LocationServiceEvent.success(currentPlace: $currentPlace)';
  }
}

/// @nodoc
abstract mixin class _$LocationServiceEventSuccessCopyWith<$Res>
    implements $LocationServiceEventCopyWith<$Res> {
  factory _$LocationServiceEventSuccessCopyWith(
          _LocationServiceEventSuccess value,
          $Res Function(_LocationServiceEventSuccess) _then) =
      __$LocationServiceEventSuccessCopyWithImpl;
  @useResult
  $Res call({CurrentLocation? currentPlace});
}

/// @nodoc
class __$LocationServiceEventSuccessCopyWithImpl<$Res>
    implements _$LocationServiceEventSuccessCopyWith<$Res> {
  __$LocationServiceEventSuccessCopyWithImpl(this._self, this._then);

  final _LocationServiceEventSuccess _self;
  final $Res Function(_LocationServiceEventSuccess) _then;

  /// Create a copy of LocationServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPlace = freezed,
  }) {
    return _then(_LocationServiceEventSuccess(
      freezed == currentPlace
          ? _self.currentPlace
          : currentPlace // ignore: cast_nullable_to_non_nullable
              as CurrentLocation?,
    ));
  }
}

// dart format on
