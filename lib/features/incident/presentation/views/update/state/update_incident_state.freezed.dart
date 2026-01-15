// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_incident_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateIncidentState {
  String? get address;
  String? get howTo;
  String? get errorMessage;
  TextEditingController? get stateController;
  TextEditingController? get cityController; // String? errorAddress,
// String? stateError,
// String? cityError,
  String? get updateError;
  dynamic get updatedSuccessfully;
  bool get isFormValid;
  bool get isLoading;

  /// Create a copy of UpdateIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateIncidentStateCopyWith<UpdateIncidentState> get copyWith =>
      _$UpdateIncidentStateCopyWithImpl<UpdateIncidentState>(
          this as UpdateIncidentState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateIncidentState &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.howTo, howTo) || other.howTo == howTo) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stateController, stateController) ||
                other.stateController == stateController) &&
            (identical(other.cityController, cityController) ||
                other.cityController == cityController) &&
            (identical(other.updateError, updateError) ||
                other.updateError == updateError) &&
            const DeepCollectionEquality()
                .equals(other.updatedSuccessfully, updatedSuccessfully) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      howTo,
      errorMessage,
      stateController,
      cityController,
      updateError,
      const DeepCollectionEquality().hash(updatedSuccessfully),
      isFormValid,
      isLoading);

  @override
  String toString() {
    return 'UpdateIncidentState(address: $address, howTo: $howTo, errorMessage: $errorMessage, stateController: $stateController, cityController: $cityController, updateError: $updateError, updatedSuccessfully: $updatedSuccessfully, isFormValid: $isFormValid, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class $UpdateIncidentStateCopyWith<$Res> {
  factory $UpdateIncidentStateCopyWith(
          UpdateIncidentState value, $Res Function(UpdateIncidentState) _then) =
      _$UpdateIncidentStateCopyWithImpl;
  @useResult
  $Res call(
      {String? address,
      String? howTo,
      String? errorMessage,
      TextEditingController? stateController,
      TextEditingController? cityController,
      String? updateError,
      dynamic updatedSuccessfully,
      bool isFormValid,
      bool isLoading});
}

/// @nodoc
class _$UpdateIncidentStateCopyWithImpl<$Res>
    implements $UpdateIncidentStateCopyWith<$Res> {
  _$UpdateIncidentStateCopyWithImpl(this._self, this._then);

  final UpdateIncidentState _self;
  final $Res Function(UpdateIncidentState) _then;

  /// Create a copy of UpdateIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? howTo = freezed,
    Object? errorMessage = freezed,
    Object? stateController = freezed,
    Object? cityController = freezed,
    Object? updateError = freezed,
    Object? updatedSuccessfully = freezed,
    Object? isFormValid = null,
    Object? isLoading = null,
  }) {
    return _then(_self.copyWith(
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      howTo: freezed == howTo
          ? _self.howTo
          : howTo // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stateController: freezed == stateController
          ? _self.stateController
          : stateController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      cityController: freezed == cityController
          ? _self.cityController
          : cityController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      updateError: freezed == updateError
          ? _self.updateError
          : updateError // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedSuccessfully: freezed == updatedSuccessfully
          ? _self.updatedSuccessfully
          : updatedSuccessfully // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFormValid: null == isFormValid
          ? _self.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdateIncidentState].
extension UpdateIncidentStatePatterns on UpdateIncidentState {
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
    TResult Function(_UpdateIncidentState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateIncidentState() when $default != null:
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
    TResult Function(_UpdateIncidentState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateIncidentState():
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
    TResult? Function(_UpdateIncidentState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateIncidentState() when $default != null:
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
            String? address,
            String? howTo,
            String? errorMessage,
            TextEditingController? stateController,
            TextEditingController? cityController,
            String? updateError,
            dynamic updatedSuccessfully,
            bool isFormValid,
            bool isLoading)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateIncidentState() when $default != null:
        return $default(
            _that.address,
            _that.howTo,
            _that.errorMessage,
            _that.stateController,
            _that.cityController,
            _that.updateError,
            _that.updatedSuccessfully,
            _that.isFormValid,
            _that.isLoading);
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
            String? address,
            String? howTo,
            String? errorMessage,
            TextEditingController? stateController,
            TextEditingController? cityController,
            String? updateError,
            dynamic updatedSuccessfully,
            bool isFormValid,
            bool isLoading)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateIncidentState():
        return $default(
            _that.address,
            _that.howTo,
            _that.errorMessage,
            _that.stateController,
            _that.cityController,
            _that.updateError,
            _that.updatedSuccessfully,
            _that.isFormValid,
            _that.isLoading);
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
            String? address,
            String? howTo,
            String? errorMessage,
            TextEditingController? stateController,
            TextEditingController? cityController,
            String? updateError,
            dynamic updatedSuccessfully,
            bool isFormValid,
            bool isLoading)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateIncidentState() when $default != null:
        return $default(
            _that.address,
            _that.howTo,
            _that.errorMessage,
            _that.stateController,
            _that.cityController,
            _that.updateError,
            _that.updatedSuccessfully,
            _that.isFormValid,
            _that.isLoading);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UpdateIncidentState implements UpdateIncidentState {
  const _UpdateIncidentState(
      {this.address,
      this.howTo,
      this.errorMessage,
      this.stateController,
      this.cityController,
      this.updateError,
      this.updatedSuccessfully = false,
      this.isFormValid = false,
      this.isLoading = false});

  @override
  final String? address;
  @override
  final String? howTo;
  @override
  final String? errorMessage;
  @override
  final TextEditingController? stateController;
  @override
  final TextEditingController? cityController;
// String? errorAddress,
// String? stateError,
// String? cityError,
  @override
  final String? updateError;
  @override
  @JsonKey()
  final dynamic updatedSuccessfully;
  @override
  @JsonKey()
  final bool isFormValid;
  @override
  @JsonKey()
  final bool isLoading;

  /// Create a copy of UpdateIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateIncidentStateCopyWith<_UpdateIncidentState> get copyWith =>
      __$UpdateIncidentStateCopyWithImpl<_UpdateIncidentState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateIncidentState &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.howTo, howTo) || other.howTo == howTo) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stateController, stateController) ||
                other.stateController == stateController) &&
            (identical(other.cityController, cityController) ||
                other.cityController == cityController) &&
            (identical(other.updateError, updateError) ||
                other.updateError == updateError) &&
            const DeepCollectionEquality()
                .equals(other.updatedSuccessfully, updatedSuccessfully) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      howTo,
      errorMessage,
      stateController,
      cityController,
      updateError,
      const DeepCollectionEquality().hash(updatedSuccessfully),
      isFormValid,
      isLoading);

  @override
  String toString() {
    return 'UpdateIncidentState(address: $address, howTo: $howTo, errorMessage: $errorMessage, stateController: $stateController, cityController: $cityController, updateError: $updateError, updatedSuccessfully: $updatedSuccessfully, isFormValid: $isFormValid, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class _$UpdateIncidentStateCopyWith<$Res>
    implements $UpdateIncidentStateCopyWith<$Res> {
  factory _$UpdateIncidentStateCopyWith(_UpdateIncidentState value,
          $Res Function(_UpdateIncidentState) _then) =
      __$UpdateIncidentStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? address,
      String? howTo,
      String? errorMessage,
      TextEditingController? stateController,
      TextEditingController? cityController,
      String? updateError,
      dynamic updatedSuccessfully,
      bool isFormValid,
      bool isLoading});
}

/// @nodoc
class __$UpdateIncidentStateCopyWithImpl<$Res>
    implements _$UpdateIncidentStateCopyWith<$Res> {
  __$UpdateIncidentStateCopyWithImpl(this._self, this._then);

  final _UpdateIncidentState _self;
  final $Res Function(_UpdateIncidentState) _then;

  /// Create a copy of UpdateIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address = freezed,
    Object? howTo = freezed,
    Object? errorMessage = freezed,
    Object? stateController = freezed,
    Object? cityController = freezed,
    Object? updateError = freezed,
    Object? updatedSuccessfully = freezed,
    Object? isFormValid = null,
    Object? isLoading = null,
  }) {
    return _then(_UpdateIncidentState(
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      howTo: freezed == howTo
          ? _self.howTo
          : howTo // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stateController: freezed == stateController
          ? _self.stateController
          : stateController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      cityController: freezed == cityController
          ? _self.cityController
          : cityController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      updateError: freezed == updateError
          ? _self.updateError
          : updateError // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedSuccessfully: freezed == updatedSuccessfully
          ? _self.updatedSuccessfully
          : updatedSuccessfully // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFormValid: null == isFormValid
          ? _self.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
