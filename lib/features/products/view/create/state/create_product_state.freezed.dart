// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateProductState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CreateProductState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CreateProductState()';
  }
}

/// @nodoc
class $CreateProductStateCopyWith<$Res> {
  $CreateProductStateCopyWith(
      CreateProductState _, $Res Function(CreateProductState) __);
}

/// Adds pattern-matching-related methods to [CreateProductState].
extension CreateProductStatePatterns on CreateProductState {
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
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Data value) data,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Data value)? data,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
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
            int currentStep,
            List<ItemProduct> items,
            bool hasItemSelected,
            String? model,
            String? errorModel,
            String? licencePlate,
            String? errorLicencePlate,
            int? year,
            String? errorYear,
            String? brand,
            String? color,
            bool? stepAddProductInfoDetailValid,
            String? obs,
            ImageMedia? imageMedia,
            bool stepAddPhotoValid,
            bool isLoading,
            bool isSuccess,
            String? errorMessage)?
        data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Data() when data != null:
        return data(
            _that.currentStep,
            _that.items,
            _that.hasItemSelected,
            _that.model,
            _that.errorModel,
            _that.licencePlate,
            _that.errorLicencePlate,
            _that.year,
            _that.errorYear,
            _that.brand,
            _that.color,
            _that.stepAddProductInfoDetailValid,
            _that.obs,
            _that.imageMedia,
            _that.stepAddPhotoValid,
            _that.isLoading,
            _that.isSuccess,
            _that.errorMessage);
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
            int currentStep,
            List<ItemProduct> items,
            bool hasItemSelected,
            String? model,
            String? errorModel,
            String? licencePlate,
            String? errorLicencePlate,
            int? year,
            String? errorYear,
            String? brand,
            String? color,
            bool? stepAddProductInfoDetailValid,
            String? obs,
            ImageMedia? imageMedia,
            bool stepAddPhotoValid,
            bool isLoading,
            bool isSuccess,
            String? errorMessage)
        data,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Data():
        return data(
            _that.currentStep,
            _that.items,
            _that.hasItemSelected,
            _that.model,
            _that.errorModel,
            _that.licencePlate,
            _that.errorLicencePlate,
            _that.year,
            _that.errorYear,
            _that.brand,
            _that.color,
            _that.stepAddProductInfoDetailValid,
            _that.obs,
            _that.imageMedia,
            _that.stepAddPhotoValid,
            _that.isLoading,
            _that.isSuccess,
            _that.errorMessage);
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
            int currentStep,
            List<ItemProduct> items,
            bool hasItemSelected,
            String? model,
            String? errorModel,
            String? licencePlate,
            String? errorLicencePlate,
            int? year,
            String? errorYear,
            String? brand,
            String? color,
            bool? stepAddProductInfoDetailValid,
            String? obs,
            ImageMedia? imageMedia,
            bool stepAddPhotoValid,
            bool isLoading,
            bool isSuccess,
            String? errorMessage)?
        data,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Data() when data != null:
        return data(
            _that.currentStep,
            _that.items,
            _that.hasItemSelected,
            _that.model,
            _that.errorModel,
            _that.licencePlate,
            _that.errorLicencePlate,
            _that.year,
            _that.errorYear,
            _that.brand,
            _that.color,
            _that.stepAddProductInfoDetailValid,
            _that.obs,
            _that.imageMedia,
            _that.stepAddPhotoValid,
            _that.isLoading,
            _that.isSuccess,
            _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial extends CreateProductState {
  const _Initial() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CreateProductState.initial()';
  }
}

/// @nodoc

class _Data extends CreateProductState {
  const _Data(
      {this.currentStep = 0,
      final List<ItemProduct> items = const [],
      this.hasItemSelected = false,
      this.model,
      this.errorModel,
      this.licencePlate,
      this.errorLicencePlate,
      this.year,
      this.errorYear,
      this.brand,
      this.color,
      this.stepAddProductInfoDetailValid,
      this.obs,
      this.imageMedia,
      this.stepAddPhotoValid = false,
      this.isLoading = false,
      this.isSuccess = false,
      this.errorMessage})
      : _items = items,
        super._();

  @JsonKey()
  final int currentStep;
  final List<ItemProduct> _items;
  @JsonKey()
  List<ItemProduct> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @JsonKey()
  final bool hasItemSelected;
// Step 0
  final String? model;
  final String? errorModel;
  final String? licencePlate;
  final String? errorLicencePlate;
  final int? year;
  final String? errorYear;
  final String? brand;
  final String? color;
  final bool? stepAddProductInfoDetailValid;
// Step 2
  final String? obs;
// Step 2
  final ImageMedia? imageMedia;
  @JsonKey()
  final bool stepAddPhotoValid;
  @JsonKey()
  final bool isLoading;
  @JsonKey()
  final bool isSuccess;
  final String? errorMessage;

  /// Create a copy of CreateProductState
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
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.hasItemSelected, hasItemSelected) ||
                other.hasItemSelected == hasItemSelected) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.errorModel, errorModel) ||
                other.errorModel == errorModel) &&
            (identical(other.licencePlate, licencePlate) ||
                other.licencePlate == licencePlate) &&
            (identical(other.errorLicencePlate, errorLicencePlate) ||
                other.errorLicencePlate == errorLicencePlate) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.errorYear, errorYear) ||
                other.errorYear == errorYear) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.stepAddProductInfoDetailValid,
                    stepAddProductInfoDetailValid) ||
                other.stepAddProductInfoDetailValid ==
                    stepAddProductInfoDetailValid) &&
            (identical(other.obs, obs) || other.obs == obs) &&
            (identical(other.imageMedia, imageMedia) ||
                other.imageMedia == imageMedia) &&
            (identical(other.stepAddPhotoValid, stepAddPhotoValid) ||
                other.stepAddPhotoValid == stepAddPhotoValid) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentStep,
      const DeepCollectionEquality().hash(_items),
      hasItemSelected,
      model,
      errorModel,
      licencePlate,
      errorLicencePlate,
      year,
      errorYear,
      brand,
      color,
      stepAddProductInfoDetailValid,
      obs,
      imageMedia,
      stepAddPhotoValid,
      isLoading,
      isSuccess,
      errorMessage);

  @override
  String toString() {
    return 'CreateProductState.data(currentStep: $currentStep, items: $items, hasItemSelected: $hasItemSelected, model: $model, errorModel: $errorModel, licencePlate: $licencePlate, errorLicencePlate: $errorLicencePlate, year: $year, errorYear: $errorYear, brand: $brand, color: $color, stepAddProductInfoDetailValid: $stepAddProductInfoDetailValid, obs: $obs, imageMedia: $imageMedia, stepAddPhotoValid: $stepAddPhotoValid, isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res>
    implements $CreateProductStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @useResult
  $Res call(
      {int currentStep,
      List<ItemProduct> items,
      bool hasItemSelected,
      String? model,
      String? errorModel,
      String? licencePlate,
      String? errorLicencePlate,
      int? year,
      String? errorYear,
      String? brand,
      String? color,
      bool? stepAddProductInfoDetailValid,
      String? obs,
      ImageMedia? imageMedia,
      bool stepAddPhotoValid,
      bool isLoading,
      bool isSuccess,
      String? errorMessage});
}

/// @nodoc
class __$DataCopyWithImpl<$Res> implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

  /// Create a copy of CreateProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentStep = null,
    Object? items = null,
    Object? hasItemSelected = null,
    Object? model = freezed,
    Object? errorModel = freezed,
    Object? licencePlate = freezed,
    Object? errorLicencePlate = freezed,
    Object? year = freezed,
    Object? errorYear = freezed,
    Object? brand = freezed,
    Object? color = freezed,
    Object? stepAddProductInfoDetailValid = freezed,
    Object? obs = freezed,
    Object? imageMedia = freezed,
    Object? stepAddPhotoValid = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_Data(
      currentStep: null == currentStep
          ? _self.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemProduct>,
      hasItemSelected: null == hasItemSelected
          ? _self.hasItemSelected
          : hasItemSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      errorModel: freezed == errorModel
          ? _self.errorModel
          : errorModel // ignore: cast_nullable_to_non_nullable
              as String?,
      licencePlate: freezed == licencePlate
          ? _self.licencePlate
          : licencePlate // ignore: cast_nullable_to_non_nullable
              as String?,
      errorLicencePlate: freezed == errorLicencePlate
          ? _self.errorLicencePlate
          : errorLicencePlate // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      errorYear: freezed == errorYear
          ? _self.errorYear
          : errorYear // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _self.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      stepAddProductInfoDetailValid: freezed == stepAddProductInfoDetailValid
          ? _self.stepAddProductInfoDetailValid
          : stepAddProductInfoDetailValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      obs: freezed == obs
          ? _self.obs
          : obs // ignore: cast_nullable_to_non_nullable
              as String?,
      imageMedia: freezed == imageMedia
          ? _self.imageMedia
          : imageMedia // ignore: cast_nullable_to_non_nullable
              as ImageMedia?,
      stepAddPhotoValid: null == stepAddPhotoValid
          ? _self.stepAddPhotoValid
          : stepAddPhotoValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
