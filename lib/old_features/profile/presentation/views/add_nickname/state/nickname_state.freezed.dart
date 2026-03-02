// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nickname_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NicknameState {
  String? get nickname;
  String? get errorMessage;
  bool get isLoading;
  bool get isSuccess;
  bool get isFormValid;
  List<String> get suggestedNicknames;

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NicknameStateCopyWith<NicknameState> get copyWith =>
      _$NicknameStateCopyWithImpl<NicknameState>(
          this as NicknameState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NicknameState &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid) &&
            const DeepCollectionEquality()
                .equals(other.suggestedNicknames, suggestedNicknames));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      nickname,
      errorMessage,
      isLoading,
      isSuccess,
      isFormValid,
      const DeepCollectionEquality().hash(suggestedNicknames));

  @override
  String toString() {
    return 'NicknameState(nickname: $nickname, errorMessage: $errorMessage, isLoading: $isLoading, isSuccess: $isSuccess, isFormValid: $isFormValid, suggestedNicknames: $suggestedNicknames)';
  }
}

/// @nodoc
abstract mixin class $NicknameStateCopyWith<$Res> {
  factory $NicknameStateCopyWith(
          NicknameState value, $Res Function(NicknameState) _then) =
      _$NicknameStateCopyWithImpl;
  @useResult
  $Res call(
      {String? nickname,
      String? errorMessage,
      bool isLoading,
      bool isSuccess,
      bool isFormValid,
      List<String> suggestedNicknames});
}

/// @nodoc
class _$NicknameStateCopyWithImpl<$Res>
    implements $NicknameStateCopyWith<$Res> {
  _$NicknameStateCopyWithImpl(this._self, this._then);

  final NicknameState _self;
  final $Res Function(NicknameState) _then;

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = freezed,
    Object? errorMessage = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFormValid = null,
    Object? suggestedNicknames = null,
  }) {
    return _then(_self.copyWith(
      nickname: freezed == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
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
      suggestedNicknames: null == suggestedNicknames
          ? _self.suggestedNicknames
          : suggestedNicknames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [NicknameState].
extension NicknameStatePatterns on NicknameState {
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
    TResult Function(_NicknameState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NicknameState() when $default != null:
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
    TResult Function(_NicknameState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NicknameState():
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
    TResult? Function(_NicknameState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NicknameState() when $default != null:
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
    TResult Function(String? nickname, String? errorMessage, bool isLoading,
            bool isSuccess, bool isFormValid, List<String> suggestedNicknames)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NicknameState() when $default != null:
        return $default(_that.nickname, _that.errorMessage, _that.isLoading,
            _that.isSuccess, _that.isFormValid, _that.suggestedNicknames);
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
    TResult Function(String? nickname, String? errorMessage, bool isLoading,
            bool isSuccess, bool isFormValid, List<String> suggestedNicknames)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NicknameState():
        return $default(_that.nickname, _that.errorMessage, _that.isLoading,
            _that.isSuccess, _that.isFormValid, _that.suggestedNicknames);
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
    TResult? Function(String? nickname, String? errorMessage, bool isLoading,
            bool isSuccess, bool isFormValid, List<String> suggestedNicknames)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NicknameState() when $default != null:
        return $default(_that.nickname, _that.errorMessage, _that.isLoading,
            _that.isSuccess, _that.isFormValid, _that.suggestedNicknames);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NicknameState implements NicknameState {
  const _NicknameState(
      {this.nickname,
      this.errorMessage,
      this.isLoading = false,
      this.isSuccess = false,
      this.isFormValid = false,
      final List<String> suggestedNicknames = const []})
      : _suggestedNicknames = suggestedNicknames;

  @override
  final String? nickname;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool isFormValid;
  final List<String> _suggestedNicknames;
  @override
  @JsonKey()
  List<String> get suggestedNicknames {
    if (_suggestedNicknames is EqualUnmodifiableListView)
      return _suggestedNicknames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedNicknames);
  }

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NicknameStateCopyWith<_NicknameState> get copyWith =>
      __$NicknameStateCopyWithImpl<_NicknameState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NicknameState &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid) &&
            const DeepCollectionEquality()
                .equals(other._suggestedNicknames, _suggestedNicknames));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      nickname,
      errorMessage,
      isLoading,
      isSuccess,
      isFormValid,
      const DeepCollectionEquality().hash(_suggestedNicknames));

  @override
  String toString() {
    return 'NicknameState(nickname: $nickname, errorMessage: $errorMessage, isLoading: $isLoading, isSuccess: $isSuccess, isFormValid: $isFormValid, suggestedNicknames: $suggestedNicknames)';
  }
}

/// @nodoc
abstract mixin class _$NicknameStateCopyWith<$Res>
    implements $NicknameStateCopyWith<$Res> {
  factory _$NicknameStateCopyWith(
          _NicknameState value, $Res Function(_NicknameState) _then) =
      __$NicknameStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? nickname,
      String? errorMessage,
      bool isLoading,
      bool isSuccess,
      bool isFormValid,
      List<String> suggestedNicknames});
}

/// @nodoc
class __$NicknameStateCopyWithImpl<$Res>
    implements _$NicknameStateCopyWith<$Res> {
  __$NicknameStateCopyWithImpl(this._self, this._then);

  final _NicknameState _self;
  final $Res Function(_NicknameState) _then;

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nickname = freezed,
    Object? errorMessage = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFormValid = null,
    Object? suggestedNicknames = null,
  }) {
    return _then(_NicknameState(
      nickname: freezed == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
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
      suggestedNicknames: null == suggestedNicknames
          ? _self._suggestedNicknames
          : suggestedNicknames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
