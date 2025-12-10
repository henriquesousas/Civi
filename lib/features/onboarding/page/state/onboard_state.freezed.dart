// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnboardState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OnboardState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OnboardState()';
  }
}

/// @nodoc
class $OnboardStateCopyWith<$Res> {
  $OnboardStateCopyWith(OnboardState _, $Res Function(OnboardState) __);
}

/// Adds pattern-matching-related methods to [OnboardState].
extension OnboardStatePatterns on OnboardState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoginSuccess value)? loginSucceeded,
    TResult Function(_SessionReady value)? sessionReady,
    TResult Function(_LoginFailed value)? loginFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _LoginSuccess() when loginSucceeded != null:
        return loginSucceeded(_that);
      case _SessionReady() when sessionReady != null:
        return sessionReady(_that);
      case _LoginFailed() when loginFailed != null:
        return loginFailed(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoginSuccess value) loginSucceeded,
    required TResult Function(_SessionReady value) sessionReady,
    required TResult Function(_LoginFailed value) loginFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _LoginSuccess():
        return loginSucceeded(_that);
      case _SessionReady():
        return sessionReady(_that);
      case _LoginFailed():
        return loginFailed(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoginSuccess value)? loginSucceeded,
    TResult? Function(_SessionReady value)? sessionReady,
    TResult? Function(_LoginFailed value)? loginFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _LoginSuccess() when loginSucceeded != null:
        return loginSucceeded(_that);
      case _SessionReady() when sessionReady != null:
        return sessionReady(_that);
      case _LoginFailed() when loginFailed != null:
        return loginFailed(_that);
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
    TResult Function()? loading,
    TResult Function(User user)? loginSucceeded,
    TResult Function()? sessionReady,
    TResult Function()? loginFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _LoginSuccess() when loginSucceeded != null:
        return loginSucceeded(_that.user);
      case _SessionReady() when sessionReady != null:
        return sessionReady();
      case _LoginFailed() when loginFailed != null:
        return loginFailed();
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
    required TResult Function() loading,
    required TResult Function(User user) loginSucceeded,
    required TResult Function() sessionReady,
    required TResult Function() loginFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _LoginSuccess():
        return loginSucceeded(_that.user);
      case _SessionReady():
        return sessionReady();
      case _LoginFailed():
        return loginFailed();
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
    TResult? Function()? loading,
    TResult? Function(User user)? loginSucceeded,
    TResult? Function()? sessionReady,
    TResult? Function()? loginFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _LoginSuccess() when loginSucceeded != null:
        return loginSucceeded(_that.user);
      case _SessionReady() when sessionReady != null:
        return sessionReady();
      case _LoginFailed() when loginFailed != null:
        return loginFailed();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements OnboardState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OnboardState.initial()';
  }
}

/// @nodoc

class _Loading implements OnboardState {
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
    return 'OnboardState.loading()';
  }
}

/// @nodoc

class _LoginSuccess implements OnboardState {
  const _LoginSuccess(this.user);

  final User user;

  /// Create a copy of OnboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginSuccessCopyWith<_LoginSuccess> get copyWith =>
      __$LoginSuccessCopyWithImpl<_LoginSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginSuccess &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'OnboardState.loginSucceeded(user: $user)';
  }
}

/// @nodoc
abstract mixin class _$LoginSuccessCopyWith<$Res>
    implements $OnboardStateCopyWith<$Res> {
  factory _$LoginSuccessCopyWith(
          _LoginSuccess value, $Res Function(_LoginSuccess) _then) =
      __$LoginSuccessCopyWithImpl;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$LoginSuccessCopyWithImpl<$Res>
    implements _$LoginSuccessCopyWith<$Res> {
  __$LoginSuccessCopyWithImpl(this._self, this._then);

  final _LoginSuccess _self;
  final $Res Function(_LoginSuccess) _then;

  /// Create a copy of OnboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(_LoginSuccess(
      null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _SessionReady implements OnboardState {
  const _SessionReady();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SessionReady);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OnboardState.sessionReady()';
  }
}

/// @nodoc

class _LoginFailed implements OnboardState {
  const _LoginFailed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoginFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OnboardState.loginFailed()';
  }
}

// dart format on
