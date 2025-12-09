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
    TResult Function(_OnboardStateInitial value)? initial,
    TResult Function(_OnboardStateLoginSuccess value)? loginSuccess,
    TResult Function(_OnboardStateLoginError value)? loginError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OnboardStateInitial() when initial != null:
        return initial(_that);
      case _OnboardStateLoginSuccess() when loginSuccess != null:
        return loginSuccess(_that);
      case _OnboardStateLoginError() when loginError != null:
        return loginError(_that);
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
    required TResult Function(_OnboardStateInitial value) initial,
    required TResult Function(_OnboardStateLoginSuccess value) loginSuccess,
    required TResult Function(_OnboardStateLoginError value) loginError,
  }) {
    final _that = this;
    switch (_that) {
      case _OnboardStateInitial():
        return initial(_that);
      case _OnboardStateLoginSuccess():
        return loginSuccess(_that);
      case _OnboardStateLoginError():
        return loginError(_that);
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
    TResult? Function(_OnboardStateInitial value)? initial,
    TResult? Function(_OnboardStateLoginSuccess value)? loginSuccess,
    TResult? Function(_OnboardStateLoginError value)? loginError,
  }) {
    final _that = this;
    switch (_that) {
      case _OnboardStateInitial() when initial != null:
        return initial(_that);
      case _OnboardStateLoginSuccess() when loginSuccess != null:
        return loginSuccess(_that);
      case _OnboardStateLoginError() when loginError != null:
        return loginError(_that);
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
    TResult Function()? loginSuccess,
    TResult Function()? loginError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OnboardStateInitial() when initial != null:
        return initial();
      case _OnboardStateLoginSuccess() when loginSuccess != null:
        return loginSuccess();
      case _OnboardStateLoginError() when loginError != null:
        return loginError();
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
    required TResult Function() loginSuccess,
    required TResult Function() loginError,
  }) {
    final _that = this;
    switch (_that) {
      case _OnboardStateInitial():
        return initial();
      case _OnboardStateLoginSuccess():
        return loginSuccess();
      case _OnboardStateLoginError():
        return loginError();
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
    TResult? Function()? loginSuccess,
    TResult? Function()? loginError,
  }) {
    final _that = this;
    switch (_that) {
      case _OnboardStateInitial() when initial != null:
        return initial();
      case _OnboardStateLoginSuccess() when loginSuccess != null:
        return loginSuccess();
      case _OnboardStateLoginError() when loginError != null:
        return loginError();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OnboardStateInitial implements OnboardState {
  const _OnboardStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _OnboardStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OnboardState.initial()';
  }
}

/// @nodoc

class _OnboardStateLoginSuccess implements OnboardState {
  const _OnboardStateLoginSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnboardStateLoginSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OnboardState.loginSuccess()';
  }
}

/// @nodoc

class _OnboardStateLoginError implements OnboardState {
  const _OnboardStateLoginError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _OnboardStateLoginError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OnboardState.loginError()';
  }
}

// dart format on
