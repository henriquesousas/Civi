// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_incident_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddIncidentState {
  Place? get currentPlace;
  Product? get product;
  String? get fullAddress;
  String? get errorFullAddress;
  String? get howTo;
  DateTime? get occurredAt;
  String? get errorOccurredAt;
  TimeOfDay? get timeOccurredAt;
  String? get errorTimeOccurredAt;
  String? get errorMessage;
  String? get successMessage;
  TextEditingController? get stateController;
  String? get stateError;
  TextEditingController? get cityController;
  String? get cityError;
  TypeAlert get type;
  bool get isFormValid;

  /// Create a copy of AddIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddIncidentStateCopyWith<AddIncidentState> get copyWith =>
      _$AddIncidentStateCopyWithImpl<AddIncidentState>(
          this as AddIncidentState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddIncidentState &&
            (identical(other.currentPlace, currentPlace) ||
                other.currentPlace == currentPlace) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.errorFullAddress, errorFullAddress) ||
                other.errorFullAddress == errorFullAddress) &&
            (identical(other.howTo, howTo) || other.howTo == howTo) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt) &&
            (identical(other.errorOccurredAt, errorOccurredAt) ||
                other.errorOccurredAt == errorOccurredAt) &&
            (identical(other.timeOccurredAt, timeOccurredAt) ||
                other.timeOccurredAt == timeOccurredAt) &&
            (identical(other.errorTimeOccurredAt, errorTimeOccurredAt) ||
                other.errorTimeOccurredAt == errorTimeOccurredAt) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.stateController, stateController) ||
                other.stateController == stateController) &&
            (identical(other.stateError, stateError) ||
                other.stateError == stateError) &&
            (identical(other.cityController, cityController) ||
                other.cityController == cityController) &&
            (identical(other.cityError, cityError) ||
                other.cityError == cityError) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPlace,
      product,
      fullAddress,
      errorFullAddress,
      howTo,
      occurredAt,
      errorOccurredAt,
      timeOccurredAt,
      errorTimeOccurredAt,
      errorMessage,
      successMessage,
      stateController,
      stateError,
      cityController,
      cityError,
      type,
      isFormValid);

  @override
  String toString() {
    return 'AddIncidentState(currentPlace: $currentPlace, product: $product, fullAddress: $fullAddress, errorFullAddress: $errorFullAddress, howTo: $howTo, occurredAt: $occurredAt, errorOccurredAt: $errorOccurredAt, timeOccurredAt: $timeOccurredAt, errorTimeOccurredAt: $errorTimeOccurredAt, errorMessage: $errorMessage, successMessage: $successMessage, stateController: $stateController, stateError: $stateError, cityController: $cityController, cityError: $cityError, type: $type, isFormValid: $isFormValid)';
  }
}

/// @nodoc
abstract mixin class $AddIncidentStateCopyWith<$Res> {
  factory $AddIncidentStateCopyWith(
          AddIncidentState value, $Res Function(AddIncidentState) _then) =
      _$AddIncidentStateCopyWithImpl;
  @useResult
  $Res call(
      {Place? currentPlace,
      Product? product,
      String? fullAddress,
      String? errorFullAddress,
      String? howTo,
      DateTime? occurredAt,
      String? errorOccurredAt,
      TimeOfDay? timeOccurredAt,
      String? errorTimeOccurredAt,
      String? errorMessage,
      String? successMessage,
      TextEditingController? stateController,
      String? stateError,
      TextEditingController? cityController,
      String? cityError,
      TypeAlert type,
      bool isFormValid});
}

/// @nodoc
class _$AddIncidentStateCopyWithImpl<$Res>
    implements $AddIncidentStateCopyWith<$Res> {
  _$AddIncidentStateCopyWithImpl(this._self, this._then);

  final AddIncidentState _self;
  final $Res Function(AddIncidentState) _then;

  /// Create a copy of AddIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPlace = freezed,
    Object? product = freezed,
    Object? fullAddress = freezed,
    Object? errorFullAddress = freezed,
    Object? howTo = freezed,
    Object? occurredAt = freezed,
    Object? errorOccurredAt = freezed,
    Object? timeOccurredAt = freezed,
    Object? errorTimeOccurredAt = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? stateController = freezed,
    Object? stateError = freezed,
    Object? cityController = freezed,
    Object? cityError = freezed,
    Object? type = null,
    Object? isFormValid = null,
  }) {
    return _then(_self.copyWith(
      currentPlace: freezed == currentPlace
          ? _self.currentPlace
          : currentPlace // ignore: cast_nullable_to_non_nullable
              as Place?,
      product: freezed == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      fullAddress: freezed == fullAddress
          ? _self.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      errorFullAddress: freezed == errorFullAddress
          ? _self.errorFullAddress
          : errorFullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      howTo: freezed == howTo
          ? _self.howTo
          : howTo // ignore: cast_nullable_to_non_nullable
              as String?,
      occurredAt: freezed == occurredAt
          ? _self.occurredAt
          : occurredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorOccurredAt: freezed == errorOccurredAt
          ? _self.errorOccurredAt
          : errorOccurredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      timeOccurredAt: freezed == timeOccurredAt
          ? _self.timeOccurredAt
          : timeOccurredAt // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      errorTimeOccurredAt: freezed == errorTimeOccurredAt
          ? _self.errorTimeOccurredAt
          : errorTimeOccurredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stateController: freezed == stateController
          ? _self.stateController
          : stateController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      stateError: freezed == stateError
          ? _self.stateError
          : stateError // ignore: cast_nullable_to_non_nullable
              as String?,
      cityController: freezed == cityController
          ? _self.cityController
          : cityController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      cityError: freezed == cityError
          ? _self.cityError
          : cityError // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeAlert,
      isFormValid: null == isFormValid
          ? _self.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [AddIncidentState].
extension AddIncidentStatePatterns on AddIncidentState {
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
    TResult Function(_AddIncidentState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddIncidentState() when $default != null:
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
    TResult Function(_AddIncidentState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddIncidentState():
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
    TResult? Function(_AddIncidentState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddIncidentState() when $default != null:
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
            Place? currentPlace,
            Product? product,
            String? fullAddress,
            String? errorFullAddress,
            String? howTo,
            DateTime? occurredAt,
            String? errorOccurredAt,
            TimeOfDay? timeOccurredAt,
            String? errorTimeOccurredAt,
            String? errorMessage,
            String? successMessage,
            TextEditingController? stateController,
            String? stateError,
            TextEditingController? cityController,
            String? cityError,
            TypeAlert type,
            bool isFormValid)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddIncidentState() when $default != null:
        return $default(
            _that.currentPlace,
            _that.product,
            _that.fullAddress,
            _that.errorFullAddress,
            _that.howTo,
            _that.occurredAt,
            _that.errorOccurredAt,
            _that.timeOccurredAt,
            _that.errorTimeOccurredAt,
            _that.errorMessage,
            _that.successMessage,
            _that.stateController,
            _that.stateError,
            _that.cityController,
            _that.cityError,
            _that.type,
            _that.isFormValid);
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
            Place? currentPlace,
            Product? product,
            String? fullAddress,
            String? errorFullAddress,
            String? howTo,
            DateTime? occurredAt,
            String? errorOccurredAt,
            TimeOfDay? timeOccurredAt,
            String? errorTimeOccurredAt,
            String? errorMessage,
            String? successMessage,
            TextEditingController? stateController,
            String? stateError,
            TextEditingController? cityController,
            String? cityError,
            TypeAlert type,
            bool isFormValid)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddIncidentState():
        return $default(
            _that.currentPlace,
            _that.product,
            _that.fullAddress,
            _that.errorFullAddress,
            _that.howTo,
            _that.occurredAt,
            _that.errorOccurredAt,
            _that.timeOccurredAt,
            _that.errorTimeOccurredAt,
            _that.errorMessage,
            _that.successMessage,
            _that.stateController,
            _that.stateError,
            _that.cityController,
            _that.cityError,
            _that.type,
            _that.isFormValid);
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
            Place? currentPlace,
            Product? product,
            String? fullAddress,
            String? errorFullAddress,
            String? howTo,
            DateTime? occurredAt,
            String? errorOccurredAt,
            TimeOfDay? timeOccurredAt,
            String? errorTimeOccurredAt,
            String? errorMessage,
            String? successMessage,
            TextEditingController? stateController,
            String? stateError,
            TextEditingController? cityController,
            String? cityError,
            TypeAlert type,
            bool isFormValid)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddIncidentState() when $default != null:
        return $default(
            _that.currentPlace,
            _that.product,
            _that.fullAddress,
            _that.errorFullAddress,
            _that.howTo,
            _that.occurredAt,
            _that.errorOccurredAt,
            _that.timeOccurredAt,
            _that.errorTimeOccurredAt,
            _that.errorMessage,
            _that.successMessage,
            _that.stateController,
            _that.stateError,
            _that.cityController,
            _that.cityError,
            _that.type,
            _that.isFormValid);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddIncidentState implements AddIncidentState {
  const _AddIncidentState(
      {this.currentPlace,
      this.product,
      this.fullAddress,
      this.errorFullAddress,
      this.howTo,
      this.occurredAt,
      this.errorOccurredAt,
      this.timeOccurredAt,
      this.errorTimeOccurredAt,
      this.errorMessage,
      this.successMessage,
      this.stateController,
      this.stateError,
      this.cityController,
      this.cityError,
      this.type = TypeAlert.none,
      this.isFormValid = false});

  @override
  final Place? currentPlace;
  @override
  final Product? product;
  @override
  final String? fullAddress;
  @override
  final String? errorFullAddress;
  @override
  final String? howTo;
  @override
  final DateTime? occurredAt;
  @override
  final String? errorOccurredAt;
  @override
  final TimeOfDay? timeOccurredAt;
  @override
  final String? errorTimeOccurredAt;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;
  @override
  final TextEditingController? stateController;
  @override
  final String? stateError;
  @override
  final TextEditingController? cityController;
  @override
  final String? cityError;
  @override
  @JsonKey()
  final TypeAlert type;
  @override
  @JsonKey()
  final bool isFormValid;

  /// Create a copy of AddIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddIncidentStateCopyWith<_AddIncidentState> get copyWith =>
      __$AddIncidentStateCopyWithImpl<_AddIncidentState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddIncidentState &&
            (identical(other.currentPlace, currentPlace) ||
                other.currentPlace == currentPlace) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.errorFullAddress, errorFullAddress) ||
                other.errorFullAddress == errorFullAddress) &&
            (identical(other.howTo, howTo) || other.howTo == howTo) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt) &&
            (identical(other.errorOccurredAt, errorOccurredAt) ||
                other.errorOccurredAt == errorOccurredAt) &&
            (identical(other.timeOccurredAt, timeOccurredAt) ||
                other.timeOccurredAt == timeOccurredAt) &&
            (identical(other.errorTimeOccurredAt, errorTimeOccurredAt) ||
                other.errorTimeOccurredAt == errorTimeOccurredAt) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.stateController, stateController) ||
                other.stateController == stateController) &&
            (identical(other.stateError, stateError) ||
                other.stateError == stateError) &&
            (identical(other.cityController, cityController) ||
                other.cityController == cityController) &&
            (identical(other.cityError, cityError) ||
                other.cityError == cityError) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPlace,
      product,
      fullAddress,
      errorFullAddress,
      howTo,
      occurredAt,
      errorOccurredAt,
      timeOccurredAt,
      errorTimeOccurredAt,
      errorMessage,
      successMessage,
      stateController,
      stateError,
      cityController,
      cityError,
      type,
      isFormValid);

  @override
  String toString() {
    return 'AddIncidentState(currentPlace: $currentPlace, product: $product, fullAddress: $fullAddress, errorFullAddress: $errorFullAddress, howTo: $howTo, occurredAt: $occurredAt, errorOccurredAt: $errorOccurredAt, timeOccurredAt: $timeOccurredAt, errorTimeOccurredAt: $errorTimeOccurredAt, errorMessage: $errorMessage, successMessage: $successMessage, stateController: $stateController, stateError: $stateError, cityController: $cityController, cityError: $cityError, type: $type, isFormValid: $isFormValid)';
  }
}

/// @nodoc
abstract mixin class _$AddIncidentStateCopyWith<$Res>
    implements $AddIncidentStateCopyWith<$Res> {
  factory _$AddIncidentStateCopyWith(
          _AddIncidentState value, $Res Function(_AddIncidentState) _then) =
      __$AddIncidentStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Place? currentPlace,
      Product? product,
      String? fullAddress,
      String? errorFullAddress,
      String? howTo,
      DateTime? occurredAt,
      String? errorOccurredAt,
      TimeOfDay? timeOccurredAt,
      String? errorTimeOccurredAt,
      String? errorMessage,
      String? successMessage,
      TextEditingController? stateController,
      String? stateError,
      TextEditingController? cityController,
      String? cityError,
      TypeAlert type,
      bool isFormValid});
}

/// @nodoc
class __$AddIncidentStateCopyWithImpl<$Res>
    implements _$AddIncidentStateCopyWith<$Res> {
  __$AddIncidentStateCopyWithImpl(this._self, this._then);

  final _AddIncidentState _self;
  final $Res Function(_AddIncidentState) _then;

  /// Create a copy of AddIncidentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPlace = freezed,
    Object? product = freezed,
    Object? fullAddress = freezed,
    Object? errorFullAddress = freezed,
    Object? howTo = freezed,
    Object? occurredAt = freezed,
    Object? errorOccurredAt = freezed,
    Object? timeOccurredAt = freezed,
    Object? errorTimeOccurredAt = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? stateController = freezed,
    Object? stateError = freezed,
    Object? cityController = freezed,
    Object? cityError = freezed,
    Object? type = null,
    Object? isFormValid = null,
  }) {
    return _then(_AddIncidentState(
      currentPlace: freezed == currentPlace
          ? _self.currentPlace
          : currentPlace // ignore: cast_nullable_to_non_nullable
              as Place?,
      product: freezed == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      fullAddress: freezed == fullAddress
          ? _self.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      errorFullAddress: freezed == errorFullAddress
          ? _self.errorFullAddress
          : errorFullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      howTo: freezed == howTo
          ? _self.howTo
          : howTo // ignore: cast_nullable_to_non_nullable
              as String?,
      occurredAt: freezed == occurredAt
          ? _self.occurredAt
          : occurredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorOccurredAt: freezed == errorOccurredAt
          ? _self.errorOccurredAt
          : errorOccurredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      timeOccurredAt: freezed == timeOccurredAt
          ? _self.timeOccurredAt
          : timeOccurredAt // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      errorTimeOccurredAt: freezed == errorTimeOccurredAt
          ? _self.errorTimeOccurredAt
          : errorTimeOccurredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stateController: freezed == stateController
          ? _self.stateController
          : stateController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      stateError: freezed == stateError
          ? _self.stateError
          : stateError // ignore: cast_nullable_to_non_nullable
              as String?,
      cityController: freezed == cityController
          ? _self.cityController
          : cityController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      cityError: freezed == cityError
          ? _self.cityError
          : cityError // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeAlert,
      isFormValid: null == isFormValid
          ? _self.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
