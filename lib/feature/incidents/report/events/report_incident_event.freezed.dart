// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_incident_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportIncidentEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReportIncidentEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReportIncidentEvent()';
  }
}

/// @nodoc
class $ReportIncidentEventCopyWith<$Res> {
  $ReportIncidentEventCopyWith(
      ReportIncidentEvent _, $Res Function(ReportIncidentEvent) __);
}

/// Adds pattern-matching-related methods to [ReportIncidentEvent].
extension ReportIncidentEventPatterns on ReportIncidentEvent {
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
    TResult Function(ReportSuccessfully value)? successfully,
    TResult Function(ReportError value)? error,
    TResult Function(ReportLoadProgress value)? loadProgress,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ReportSuccessfully() when successfully != null:
        return successfully(_that);
      case ReportError() when error != null:
        return error(_that);
      case ReportLoadProgress() when loadProgress != null:
        return loadProgress(_that);
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
    required TResult Function(ReportSuccessfully value) successfully,
    required TResult Function(ReportError value) error,
    required TResult Function(ReportLoadProgress value) loadProgress,
  }) {
    final _that = this;
    switch (_that) {
      case ReportSuccessfully():
        return successfully(_that);
      case ReportError():
        return error(_that);
      case ReportLoadProgress():
        return loadProgress(_that);
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
    TResult? Function(ReportSuccessfully value)? successfully,
    TResult? Function(ReportError value)? error,
    TResult? Function(ReportLoadProgress value)? loadProgress,
  }) {
    final _that = this;
    switch (_that) {
      case ReportSuccessfully() when successfully != null:
        return successfully(_that);
      case ReportError() when error != null:
        return error(_that);
      case ReportLoadProgress() when loadProgress != null:
        return loadProgress(_that);
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
    TResult Function(RegiterIncidentSuccessArgs args)? successfully,
    TResult Function(String error, bool isKnowError)? error,
    TResult Function()? loadProgress,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ReportSuccessfully() when successfully != null:
        return successfully(_that.args);
      case ReportError() when error != null:
        return error(_that.error, _that.isKnowError);
      case ReportLoadProgress() when loadProgress != null:
        return loadProgress();
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
    required TResult Function(RegiterIncidentSuccessArgs args) successfully,
    required TResult Function(String error, bool isKnowError) error,
    required TResult Function() loadProgress,
  }) {
    final _that = this;
    switch (_that) {
      case ReportSuccessfully():
        return successfully(_that.args);
      case ReportError():
        return error(_that.error, _that.isKnowError);
      case ReportLoadProgress():
        return loadProgress();
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
    TResult? Function(RegiterIncidentSuccessArgs args)? successfully,
    TResult? Function(String error, bool isKnowError)? error,
    TResult? Function()? loadProgress,
  }) {
    final _that = this;
    switch (_that) {
      case ReportSuccessfully() when successfully != null:
        return successfully(_that.args);
      case ReportError() when error != null:
        return error(_that.error, _that.isKnowError);
      case ReportLoadProgress() when loadProgress != null:
        return loadProgress();
      case _:
        return null;
    }
  }
}

/// @nodoc

class ReportSuccessfully implements ReportIncidentEvent {
  const ReportSuccessfully(this.args);

  final RegiterIncidentSuccessArgs args;

  /// Create a copy of ReportIncidentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportSuccessfullyCopyWith<ReportSuccessfully> get copyWith =>
      _$ReportSuccessfullyCopyWithImpl<ReportSuccessfully>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportSuccessfully &&
            (identical(other.args, args) || other.args == args));
  }

  @override
  int get hashCode => Object.hash(runtimeType, args);

  @override
  String toString() {
    return 'ReportIncidentEvent.successfully(args: $args)';
  }
}

/// @nodoc
abstract mixin class $ReportSuccessfullyCopyWith<$Res>
    implements $ReportIncidentEventCopyWith<$Res> {
  factory $ReportSuccessfullyCopyWith(
          ReportSuccessfully value, $Res Function(ReportSuccessfully) _then) =
      _$ReportSuccessfullyCopyWithImpl;
  @useResult
  $Res call({RegiterIncidentSuccessArgs args});
}

/// @nodoc
class _$ReportSuccessfullyCopyWithImpl<$Res>
    implements $ReportSuccessfullyCopyWith<$Res> {
  _$ReportSuccessfullyCopyWithImpl(this._self, this._then);

  final ReportSuccessfully _self;
  final $Res Function(ReportSuccessfully) _then;

  /// Create a copy of ReportIncidentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? args = null,
  }) {
    return _then(ReportSuccessfully(
      null == args
          ? _self.args
          : args // ignore: cast_nullable_to_non_nullable
              as RegiterIncidentSuccessArgs,
    ));
  }
}

/// @nodoc

class ReportError implements ReportIncidentEvent {
  const ReportError(this.error, this.isKnowError);

  final String error;
  final bool isKnowError;

  /// Create a copy of ReportIncidentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportErrorCopyWith<ReportError> get copyWith =>
      _$ReportErrorCopyWithImpl<ReportError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportError &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isKnowError, isKnowError) ||
                other.isKnowError == isKnowError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, isKnowError);

  @override
  String toString() {
    return 'ReportIncidentEvent.error(error: $error, isKnowError: $isKnowError)';
  }
}

/// @nodoc
abstract mixin class $ReportErrorCopyWith<$Res>
    implements $ReportIncidentEventCopyWith<$Res> {
  factory $ReportErrorCopyWith(
          ReportError value, $Res Function(ReportError) _then) =
      _$ReportErrorCopyWithImpl;
  @useResult
  $Res call({String error, bool isKnowError});
}

/// @nodoc
class _$ReportErrorCopyWithImpl<$Res> implements $ReportErrorCopyWith<$Res> {
  _$ReportErrorCopyWithImpl(this._self, this._then);

  final ReportError _self;
  final $Res Function(ReportError) _then;

  /// Create a copy of ReportIncidentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? isKnowError = null,
  }) {
    return _then(ReportError(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      null == isKnowError
          ? _self.isKnowError
          : isKnowError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ReportLoadProgress implements ReportIncidentEvent {
  const ReportLoadProgress();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReportLoadProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReportIncidentEvent.loadProgress()';
  }
}

// dart format on
