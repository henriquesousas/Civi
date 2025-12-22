// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState()';
  }
}

/// @nodoc
class $ProfileStateCopyWith<$Res> {
  $ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}

/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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
    TResult Function(ProfileStateInitial value)? initial,
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProfileStateInitial() when initial != null:
        return initial(_that);
      case _Data() when data != null:
        return data(_that);
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
    required TResult Function(ProfileStateInitial value) initial,
    required TResult Function(_Data value) data,
  }) {
    final _that = this;
    switch (_that) {
      case ProfileStateInitial():
        return initial(_that);
      case _Data():
        return data(_that);
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
    TResult? Function(ProfileStateInitial value)? initial,
    TResult? Function(_Data value)? data,
  }) {
    final _that = this;
    switch (_that) {
      case ProfileStateInitial() when initial != null:
        return initial(_that);
      case _Data() when data != null:
        return data(_that);
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
    TResult Function(
            String? nickname,
            String? validationError,
            String? errorMessage,
            bool isLoading,
            bool isSuccess,
            bool isFormValid)?
        data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProfileStateInitial() when initial != null:
        return initial();
      case _Data() when data != null:
        return data(_that.nickname, _that.validationError, _that.errorMessage,
            _that.isLoading, _that.isSuccess, _that.isFormValid);
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
    required TResult Function(
            String? nickname,
            String? validationError,
            String? errorMessage,
            bool isLoading,
            bool isSuccess,
            bool isFormValid)
        data,
  }) {
    final _that = this;
    switch (_that) {
      case ProfileStateInitial():
        return initial();
      case _Data():
        return data(_that.nickname, _that.validationError, _that.errorMessage,
            _that.isLoading, _that.isSuccess, _that.isFormValid);
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
    TResult? Function(
            String? nickname,
            String? validationError,
            String? errorMessage,
            bool isLoading,
            bool isSuccess,
            bool isFormValid)?
        data,
  }) {
    final _that = this;
    switch (_that) {
      case ProfileStateInitial() when initial != null:
        return initial();
      case _Data() when data != null:
        return data(_that.nickname, _that.validationError, _that.errorMessage,
            _that.isLoading, _that.isSuccess, _that.isFormValid);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ProfileStateInitial implements ProfileState {
  const ProfileStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.initial()';
  }
}

/// @nodoc

class _Data implements ProfileState {
  const _Data(
      {this.nickname,
      this.validationError,
      this.errorMessage,
      this.isLoading = false,
      this.isSuccess = false,
      this.isFormValid = false});

  final String? nickname;
  final String? validationError;
  final String? errorMessage;
  @JsonKey()
  final bool isLoading;
  @JsonKey()
  final bool isSuccess;
  @JsonKey()
  final bool isFormValid;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.validationError, validationError) ||
                other.validationError == validationError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nickname, validationError,
      errorMessage, isLoading, isSuccess, isFormValid);

  @override
  String toString() {
    return 'ProfileState.data(nickname: $nickname, validationError: $validationError, errorMessage: $errorMessage, isLoading: $isLoading, isSuccess: $isSuccess, isFormValid: $isFormValid)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @useResult
  $Res call(
      {String? nickname,
      String? validationError,
      String? errorMessage,
      bool isLoading,
      bool isSuccess,
      bool isFormValid});
}

/// @nodoc
class __$DataCopyWithImpl<$Res> implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nickname = freezed,
    Object? validationError = freezed,
    Object? errorMessage = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFormValid = null,
  }) {
    return _then(_Data(
      nickname: freezed == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      validationError: freezed == validationError
          ? _self.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFormValid: null == isFormValid
          ? _self.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
