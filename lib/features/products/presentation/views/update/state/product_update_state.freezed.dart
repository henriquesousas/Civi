// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_update_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductUpdateState {
  int get currentStep;
  ProductType? get productType;
  String? get model;
  String? get errorModel;
  String? get licencePlate;
  String? get errorLicencePlate;
  int? get year;
  String? get errorYear;
  String? get brand;
  String? get color;
  String? get obs;
  List<ImageMedia> get imageMedia;
  bool get isLoading;
  bool get isSuccess;
  String? get errorMessage;

  /// Create a copy of ProductUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductUpdateStateCopyWith<ProductUpdateState> get copyWith =>
      _$ProductUpdateStateCopyWithImpl<ProductUpdateState>(
          this as ProductUpdateState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductUpdateState &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
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
            (identical(other.obs, obs) || other.obs == obs) &&
            const DeepCollectionEquality()
                .equals(other.imageMedia, imageMedia) &&
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
      productType,
      model,
      errorModel,
      licencePlate,
      errorLicencePlate,
      year,
      errorYear,
      brand,
      color,
      obs,
      const DeepCollectionEquality().hash(imageMedia),
      isLoading,
      isSuccess,
      errorMessage);

  @override
  String toString() {
    return 'ProductUpdateState(currentStep: $currentStep, productType: $productType, model: $model, errorModel: $errorModel, licencePlate: $licencePlate, errorLicencePlate: $errorLicencePlate, year: $year, errorYear: $errorYear, brand: $brand, color: $color, obs: $obs, imageMedia: $imageMedia, isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $ProductUpdateStateCopyWith<$Res> {
  factory $ProductUpdateStateCopyWith(
          ProductUpdateState value, $Res Function(ProductUpdateState) _then) =
      _$ProductUpdateStateCopyWithImpl;
  @useResult
  $Res call(
      {int currentStep,
      ProductType? productType,
      String? model,
      String? errorModel,
      String? licencePlate,
      String? errorLicencePlate,
      int? year,
      String? errorYear,
      String? brand,
      String? color,
      String? obs,
      List<ImageMedia> imageMedia,
      bool isLoading,
      bool isSuccess,
      String? errorMessage});
}

/// @nodoc
class _$ProductUpdateStateCopyWithImpl<$Res>
    implements $ProductUpdateStateCopyWith<$Res> {
  _$ProductUpdateStateCopyWithImpl(this._self, this._then);

  final ProductUpdateState _self;
  final $Res Function(ProductUpdateState) _then;

  /// Create a copy of ProductUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? productType = freezed,
    Object? model = freezed,
    Object? errorModel = freezed,
    Object? licencePlate = freezed,
    Object? errorLicencePlate = freezed,
    Object? year = freezed,
    Object? errorYear = freezed,
    Object? brand = freezed,
    Object? color = freezed,
    Object? obs = freezed,
    Object? imageMedia = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      currentStep: null == currentStep
          ? _self.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      productType: freezed == productType
          ? _self.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as ProductType?,
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
      obs: freezed == obs
          ? _self.obs
          : obs // ignore: cast_nullable_to_non_nullable
              as String?,
      imageMedia: null == imageMedia
          ? _self.imageMedia
          : imageMedia // ignore: cast_nullable_to_non_nullable
              as List<ImageMedia>,
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

/// Adds pattern-matching-related methods to [ProductUpdateState].
extension ProductUpdateStatePatterns on ProductUpdateState {
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
    TResult Function(_ProductUpdateState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductUpdateState() when $default != null:
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
    TResult Function(_ProductUpdateState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUpdateState():
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
    TResult? Function(_ProductUpdateState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUpdateState() when $default != null:
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
            int currentStep,
            ProductType? productType,
            String? model,
            String? errorModel,
            String? licencePlate,
            String? errorLicencePlate,
            int? year,
            String? errorYear,
            String? brand,
            String? color,
            String? obs,
            List<ImageMedia> imageMedia,
            bool isLoading,
            bool isSuccess,
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductUpdateState() when $default != null:
        return $default(
            _that.currentStep,
            _that.productType,
            _that.model,
            _that.errorModel,
            _that.licencePlate,
            _that.errorLicencePlate,
            _that.year,
            _that.errorYear,
            _that.brand,
            _that.color,
            _that.obs,
            _that.imageMedia,
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
  TResult when<TResult extends Object?>(
    TResult Function(
            int currentStep,
            ProductType? productType,
            String? model,
            String? errorModel,
            String? licencePlate,
            String? errorLicencePlate,
            int? year,
            String? errorYear,
            String? brand,
            String? color,
            String? obs,
            List<ImageMedia> imageMedia,
            bool isLoading,
            bool isSuccess,
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUpdateState():
        return $default(
            _that.currentStep,
            _that.productType,
            _that.model,
            _that.errorModel,
            _that.licencePlate,
            _that.errorLicencePlate,
            _that.year,
            _that.errorYear,
            _that.brand,
            _that.color,
            _that.obs,
            _that.imageMedia,
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int currentStep,
            ProductType? productType,
            String? model,
            String? errorModel,
            String? licencePlate,
            String? errorLicencePlate,
            int? year,
            String? errorYear,
            String? brand,
            String? color,
            String? obs,
            List<ImageMedia> imageMedia,
            bool isLoading,
            bool isSuccess,
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUpdateState() when $default != null:
        return $default(
            _that.currentStep,
            _that.productType,
            _that.model,
            _that.errorModel,
            _that.licencePlate,
            _that.errorLicencePlate,
            _that.year,
            _that.errorYear,
            _that.brand,
            _that.color,
            _that.obs,
            _that.imageMedia,
            _that.isLoading,
            _that.isSuccess,
            _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductUpdateState implements ProductUpdateState {
  const _ProductUpdateState(
      {this.currentStep = 0,
      this.productType,
      this.model,
      this.errorModel,
      this.licencePlate,
      this.errorLicencePlate,
      this.year,
      this.errorYear,
      this.brand,
      this.color,
      this.obs,
      final List<ImageMedia> imageMedia = const [],
      this.isLoading = false,
      this.isSuccess = false,
      this.errorMessage})
      : _imageMedia = imageMedia;

  @override
  @JsonKey()
  final int currentStep;
  @override
  final ProductType? productType;
  @override
  final String? model;
  @override
  final String? errorModel;
  @override
  final String? licencePlate;
  @override
  final String? errorLicencePlate;
  @override
  final int? year;
  @override
  final String? errorYear;
  @override
  final String? brand;
  @override
  final String? color;
  @override
  final String? obs;
  final List<ImageMedia> _imageMedia;
  @override
  @JsonKey()
  List<ImageMedia> get imageMedia {
    if (_imageMedia is EqualUnmodifiableListView) return _imageMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageMedia);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? errorMessage;

  /// Create a copy of ProductUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductUpdateStateCopyWith<_ProductUpdateState> get copyWith =>
      __$ProductUpdateStateCopyWithImpl<_ProductUpdateState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductUpdateState &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
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
            (identical(other.obs, obs) || other.obs == obs) &&
            const DeepCollectionEquality()
                .equals(other._imageMedia, _imageMedia) &&
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
      productType,
      model,
      errorModel,
      licencePlate,
      errorLicencePlate,
      year,
      errorYear,
      brand,
      color,
      obs,
      const DeepCollectionEquality().hash(_imageMedia),
      isLoading,
      isSuccess,
      errorMessage);

  @override
  String toString() {
    return 'ProductUpdateState(currentStep: $currentStep, productType: $productType, model: $model, errorModel: $errorModel, licencePlate: $licencePlate, errorLicencePlate: $errorLicencePlate, year: $year, errorYear: $errorYear, brand: $brand, color: $color, obs: $obs, imageMedia: $imageMedia, isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$ProductUpdateStateCopyWith<$Res>
    implements $ProductUpdateStateCopyWith<$Res> {
  factory _$ProductUpdateStateCopyWith(
          _ProductUpdateState value, $Res Function(_ProductUpdateState) _then) =
      __$ProductUpdateStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int currentStep,
      ProductType? productType,
      String? model,
      String? errorModel,
      String? licencePlate,
      String? errorLicencePlate,
      int? year,
      String? errorYear,
      String? brand,
      String? color,
      String? obs,
      List<ImageMedia> imageMedia,
      bool isLoading,
      bool isSuccess,
      String? errorMessage});
}

/// @nodoc
class __$ProductUpdateStateCopyWithImpl<$Res>
    implements _$ProductUpdateStateCopyWith<$Res> {
  __$ProductUpdateStateCopyWithImpl(this._self, this._then);

  final _ProductUpdateState _self;
  final $Res Function(_ProductUpdateState) _then;

  /// Create a copy of ProductUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentStep = null,
    Object? productType = freezed,
    Object? model = freezed,
    Object? errorModel = freezed,
    Object? licencePlate = freezed,
    Object? errorLicencePlate = freezed,
    Object? year = freezed,
    Object? errorYear = freezed,
    Object? brand = freezed,
    Object? color = freezed,
    Object? obs = freezed,
    Object? imageMedia = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_ProductUpdateState(
      currentStep: null == currentStep
          ? _self.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      productType: freezed == productType
          ? _self.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as ProductType?,
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
      obs: freezed == obs
          ? _self.obs
          : obs // ignore: cast_nullable_to_non_nullable
              as String?,
      imageMedia: null == imageMedia
          ? _self._imageMedia
          : imageMedia // ignore: cast_nullable_to_non_nullable
              as List<ImageMedia>,
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
