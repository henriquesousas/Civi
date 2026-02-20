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
  bool get isLoading;
  bool get yearUpdateLoad;
  bool get brandUpdateLoad;
  bool get colorUpdateLoad;
  bool get addingPhoto;
  bool get deletingProduct;
  bool get isSuccess;
  bool get deleteSuccess;
  bool get deleteImageSuccess;
  int get removeImageIndex;
  Product? get currentProduct;
  String? get updateValue;
  String? get errorValidation;
  String? get errorMessage;
  String? get successMessage;
  String? get errorUploadOrDeleteImage;
  dynamic get hasChangeSomeField;

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
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.yearUpdateLoad, yearUpdateLoad) ||
                other.yearUpdateLoad == yearUpdateLoad) &&
            (identical(other.brandUpdateLoad, brandUpdateLoad) ||
                other.brandUpdateLoad == brandUpdateLoad) &&
            (identical(other.colorUpdateLoad, colorUpdateLoad) ||
                other.colorUpdateLoad == colorUpdateLoad) &&
            (identical(other.addingPhoto, addingPhoto) ||
                other.addingPhoto == addingPhoto) &&
            (identical(other.deletingProduct, deletingProduct) ||
                other.deletingProduct == deletingProduct) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.deleteSuccess, deleteSuccess) ||
                other.deleteSuccess == deleteSuccess) &&
            (identical(other.deleteImageSuccess, deleteImageSuccess) ||
                other.deleteImageSuccess == deleteImageSuccess) &&
            (identical(other.removeImageIndex, removeImageIndex) ||
                other.removeImageIndex == removeImageIndex) &&
            (identical(other.currentProduct, currentProduct) ||
                other.currentProduct == currentProduct) &&
            (identical(other.updateValue, updateValue) ||
                other.updateValue == updateValue) &&
            (identical(other.errorValidation, errorValidation) ||
                other.errorValidation == errorValidation) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(
                    other.errorUploadOrDeleteImage, errorUploadOrDeleteImage) ||
                other.errorUploadOrDeleteImage == errorUploadOrDeleteImage) &&
            const DeepCollectionEquality()
                .equals(other.hasChangeSomeField, hasChangeSomeField));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      yearUpdateLoad,
      brandUpdateLoad,
      colorUpdateLoad,
      addingPhoto,
      deletingProduct,
      isSuccess,
      deleteSuccess,
      deleteImageSuccess,
      removeImageIndex,
      currentProduct,
      updateValue,
      errorValidation,
      errorMessage,
      successMessage,
      errorUploadOrDeleteImage,
      const DeepCollectionEquality().hash(hasChangeSomeField));

  @override
  String toString() {
    return 'ProductUpdateState(isLoading: $isLoading, yearUpdateLoad: $yearUpdateLoad, brandUpdateLoad: $brandUpdateLoad, colorUpdateLoad: $colorUpdateLoad, addingPhoto: $addingPhoto, deletingProduct: $deletingProduct, isSuccess: $isSuccess, deleteSuccess: $deleteSuccess, deleteImageSuccess: $deleteImageSuccess, removeImageIndex: $removeImageIndex, currentProduct: $currentProduct, updateValue: $updateValue, errorValidation: $errorValidation, errorMessage: $errorMessage, successMessage: $successMessage, errorUploadOrDeleteImage: $errorUploadOrDeleteImage, hasChangeSomeField: $hasChangeSomeField)';
  }
}

/// @nodoc
abstract mixin class $ProductUpdateStateCopyWith<$Res> {
  factory $ProductUpdateStateCopyWith(
          ProductUpdateState value, $Res Function(ProductUpdateState) _then) =
      _$ProductUpdateStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      bool yearUpdateLoad,
      bool brandUpdateLoad,
      bool colorUpdateLoad,
      bool addingPhoto,
      bool deletingProduct,
      bool isSuccess,
      bool deleteSuccess,
      bool deleteImageSuccess,
      int removeImageIndex,
      Product? currentProduct,
      String? updateValue,
      String? errorValidation,
      String? errorMessage,
      String? successMessage,
      String? errorUploadOrDeleteImage,
      dynamic hasChangeSomeField});
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
    Object? isLoading = null,
    Object? yearUpdateLoad = null,
    Object? brandUpdateLoad = null,
    Object? colorUpdateLoad = null,
    Object? addingPhoto = null,
    Object? deletingProduct = null,
    Object? isSuccess = null,
    Object? deleteSuccess = null,
    Object? deleteImageSuccess = null,
    Object? removeImageIndex = null,
    Object? currentProduct = freezed,
    Object? updateValue = freezed,
    Object? errorValidation = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? errorUploadOrDeleteImage = freezed,
    Object? hasChangeSomeField = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      yearUpdateLoad: null == yearUpdateLoad
          ? _self.yearUpdateLoad
          : yearUpdateLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      brandUpdateLoad: null == brandUpdateLoad
          ? _self.brandUpdateLoad
          : brandUpdateLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      colorUpdateLoad: null == colorUpdateLoad
          ? _self.colorUpdateLoad
          : colorUpdateLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      addingPhoto: null == addingPhoto
          ? _self.addingPhoto
          : addingPhoto // ignore: cast_nullable_to_non_nullable
              as bool,
      deletingProduct: null == deletingProduct
          ? _self.deletingProduct
          : deletingProduct // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteSuccess: null == deleteSuccess
          ? _self.deleteSuccess
          : deleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteImageSuccess: null == deleteImageSuccess
          ? _self.deleteImageSuccess
          : deleteImageSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      removeImageIndex: null == removeImageIndex
          ? _self.removeImageIndex
          : removeImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentProduct: freezed == currentProduct
          ? _self.currentProduct
          : currentProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      updateValue: freezed == updateValue
          ? _self.updateValue
          : updateValue // ignore: cast_nullable_to_non_nullable
              as String?,
      errorValidation: freezed == errorValidation
          ? _self.errorValidation
          : errorValidation // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorUploadOrDeleteImage: freezed == errorUploadOrDeleteImage
          ? _self.errorUploadOrDeleteImage
          : errorUploadOrDeleteImage // ignore: cast_nullable_to_non_nullable
              as String?,
      hasChangeSomeField: freezed == hasChangeSomeField
          ? _self.hasChangeSomeField
          : hasChangeSomeField // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
            bool isLoading,
            bool yearUpdateLoad,
            bool brandUpdateLoad,
            bool colorUpdateLoad,
            bool addingPhoto,
            bool deletingProduct,
            bool isSuccess,
            bool deleteSuccess,
            bool deleteImageSuccess,
            int removeImageIndex,
            Product? currentProduct,
            String? updateValue,
            String? errorValidation,
            String? errorMessage,
            String? successMessage,
            String? errorUploadOrDeleteImage,
            dynamic hasChangeSomeField)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductUpdateState() when $default != null:
        return $default(
            _that.isLoading,
            _that.yearUpdateLoad,
            _that.brandUpdateLoad,
            _that.colorUpdateLoad,
            _that.addingPhoto,
            _that.deletingProduct,
            _that.isSuccess,
            _that.deleteSuccess,
            _that.deleteImageSuccess,
            _that.removeImageIndex,
            _that.currentProduct,
            _that.updateValue,
            _that.errorValidation,
            _that.errorMessage,
            _that.successMessage,
            _that.errorUploadOrDeleteImage,
            _that.hasChangeSomeField);
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
            bool isLoading,
            bool yearUpdateLoad,
            bool brandUpdateLoad,
            bool colorUpdateLoad,
            bool addingPhoto,
            bool deletingProduct,
            bool isSuccess,
            bool deleteSuccess,
            bool deleteImageSuccess,
            int removeImageIndex,
            Product? currentProduct,
            String? updateValue,
            String? errorValidation,
            String? errorMessage,
            String? successMessage,
            String? errorUploadOrDeleteImage,
            dynamic hasChangeSomeField)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUpdateState():
        return $default(
            _that.isLoading,
            _that.yearUpdateLoad,
            _that.brandUpdateLoad,
            _that.colorUpdateLoad,
            _that.addingPhoto,
            _that.deletingProduct,
            _that.isSuccess,
            _that.deleteSuccess,
            _that.deleteImageSuccess,
            _that.removeImageIndex,
            _that.currentProduct,
            _that.updateValue,
            _that.errorValidation,
            _that.errorMessage,
            _that.successMessage,
            _that.errorUploadOrDeleteImage,
            _that.hasChangeSomeField);
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
            bool isLoading,
            bool yearUpdateLoad,
            bool brandUpdateLoad,
            bool colorUpdateLoad,
            bool addingPhoto,
            bool deletingProduct,
            bool isSuccess,
            bool deleteSuccess,
            bool deleteImageSuccess,
            int removeImageIndex,
            Product? currentProduct,
            String? updateValue,
            String? errorValidation,
            String? errorMessage,
            String? successMessage,
            String? errorUploadOrDeleteImage,
            dynamic hasChangeSomeField)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUpdateState() when $default != null:
        return $default(
            _that.isLoading,
            _that.yearUpdateLoad,
            _that.brandUpdateLoad,
            _that.colorUpdateLoad,
            _that.addingPhoto,
            _that.deletingProduct,
            _that.isSuccess,
            _that.deleteSuccess,
            _that.deleteImageSuccess,
            _that.removeImageIndex,
            _that.currentProduct,
            _that.updateValue,
            _that.errorValidation,
            _that.errorMessage,
            _that.successMessage,
            _that.errorUploadOrDeleteImage,
            _that.hasChangeSomeField);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductUpdateState implements ProductUpdateState {
  const _ProductUpdateState(
      {this.isLoading = false,
      this.yearUpdateLoad = false,
      this.brandUpdateLoad = false,
      this.colorUpdateLoad = false,
      this.addingPhoto = false,
      this.deletingProduct = false,
      this.isSuccess = false,
      this.deleteSuccess = false,
      this.deleteImageSuccess = false,
      this.removeImageIndex = -1,
      this.currentProduct,
      this.updateValue,
      this.errorValidation,
      this.errorMessage,
      this.successMessage,
      this.errorUploadOrDeleteImage,
      this.hasChangeSomeField = false});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool yearUpdateLoad;
  @override
  @JsonKey()
  final bool brandUpdateLoad;
  @override
  @JsonKey()
  final bool colorUpdateLoad;
  @override
  @JsonKey()
  final bool addingPhoto;
  @override
  @JsonKey()
  final bool deletingProduct;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool deleteSuccess;
  @override
  @JsonKey()
  final bool deleteImageSuccess;
  @override
  @JsonKey()
  final int removeImageIndex;
  @override
  final Product? currentProduct;
  @override
  final String? updateValue;
  @override
  final String? errorValidation;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;
  @override
  final String? errorUploadOrDeleteImage;
  @override
  @JsonKey()
  final dynamic hasChangeSomeField;

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
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.yearUpdateLoad, yearUpdateLoad) ||
                other.yearUpdateLoad == yearUpdateLoad) &&
            (identical(other.brandUpdateLoad, brandUpdateLoad) ||
                other.brandUpdateLoad == brandUpdateLoad) &&
            (identical(other.colorUpdateLoad, colorUpdateLoad) ||
                other.colorUpdateLoad == colorUpdateLoad) &&
            (identical(other.addingPhoto, addingPhoto) ||
                other.addingPhoto == addingPhoto) &&
            (identical(other.deletingProduct, deletingProduct) ||
                other.deletingProduct == deletingProduct) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.deleteSuccess, deleteSuccess) ||
                other.deleteSuccess == deleteSuccess) &&
            (identical(other.deleteImageSuccess, deleteImageSuccess) ||
                other.deleteImageSuccess == deleteImageSuccess) &&
            (identical(other.removeImageIndex, removeImageIndex) ||
                other.removeImageIndex == removeImageIndex) &&
            (identical(other.currentProduct, currentProduct) ||
                other.currentProduct == currentProduct) &&
            (identical(other.updateValue, updateValue) ||
                other.updateValue == updateValue) &&
            (identical(other.errorValidation, errorValidation) ||
                other.errorValidation == errorValidation) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(
                    other.errorUploadOrDeleteImage, errorUploadOrDeleteImage) ||
                other.errorUploadOrDeleteImage == errorUploadOrDeleteImage) &&
            const DeepCollectionEquality()
                .equals(other.hasChangeSomeField, hasChangeSomeField));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      yearUpdateLoad,
      brandUpdateLoad,
      colorUpdateLoad,
      addingPhoto,
      deletingProduct,
      isSuccess,
      deleteSuccess,
      deleteImageSuccess,
      removeImageIndex,
      currentProduct,
      updateValue,
      errorValidation,
      errorMessage,
      successMessage,
      errorUploadOrDeleteImage,
      const DeepCollectionEquality().hash(hasChangeSomeField));

  @override
  String toString() {
    return 'ProductUpdateState(isLoading: $isLoading, yearUpdateLoad: $yearUpdateLoad, brandUpdateLoad: $brandUpdateLoad, colorUpdateLoad: $colorUpdateLoad, addingPhoto: $addingPhoto, deletingProduct: $deletingProduct, isSuccess: $isSuccess, deleteSuccess: $deleteSuccess, deleteImageSuccess: $deleteImageSuccess, removeImageIndex: $removeImageIndex, currentProduct: $currentProduct, updateValue: $updateValue, errorValidation: $errorValidation, errorMessage: $errorMessage, successMessage: $successMessage, errorUploadOrDeleteImage: $errorUploadOrDeleteImage, hasChangeSomeField: $hasChangeSomeField)';
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
      {bool isLoading,
      bool yearUpdateLoad,
      bool brandUpdateLoad,
      bool colorUpdateLoad,
      bool addingPhoto,
      bool deletingProduct,
      bool isSuccess,
      bool deleteSuccess,
      bool deleteImageSuccess,
      int removeImageIndex,
      Product? currentProduct,
      String? updateValue,
      String? errorValidation,
      String? errorMessage,
      String? successMessage,
      String? errorUploadOrDeleteImage,
      dynamic hasChangeSomeField});
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
    Object? isLoading = null,
    Object? yearUpdateLoad = null,
    Object? brandUpdateLoad = null,
    Object? colorUpdateLoad = null,
    Object? addingPhoto = null,
    Object? deletingProduct = null,
    Object? isSuccess = null,
    Object? deleteSuccess = null,
    Object? deleteImageSuccess = null,
    Object? removeImageIndex = null,
    Object? currentProduct = freezed,
    Object? updateValue = freezed,
    Object? errorValidation = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? errorUploadOrDeleteImage = freezed,
    Object? hasChangeSomeField = freezed,
  }) {
    return _then(_ProductUpdateState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      yearUpdateLoad: null == yearUpdateLoad
          ? _self.yearUpdateLoad
          : yearUpdateLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      brandUpdateLoad: null == brandUpdateLoad
          ? _self.brandUpdateLoad
          : brandUpdateLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      colorUpdateLoad: null == colorUpdateLoad
          ? _self.colorUpdateLoad
          : colorUpdateLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      addingPhoto: null == addingPhoto
          ? _self.addingPhoto
          : addingPhoto // ignore: cast_nullable_to_non_nullable
              as bool,
      deletingProduct: null == deletingProduct
          ? _self.deletingProduct
          : deletingProduct // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteSuccess: null == deleteSuccess
          ? _self.deleteSuccess
          : deleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteImageSuccess: null == deleteImageSuccess
          ? _self.deleteImageSuccess
          : deleteImageSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      removeImageIndex: null == removeImageIndex
          ? _self.removeImageIndex
          : removeImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentProduct: freezed == currentProduct
          ? _self.currentProduct
          : currentProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      updateValue: freezed == updateValue
          ? _self.updateValue
          : updateValue // ignore: cast_nullable_to_non_nullable
              as String?,
      errorValidation: freezed == errorValidation
          ? _self.errorValidation
          : errorValidation // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorUploadOrDeleteImage: freezed == errorUploadOrDeleteImage
          ? _self.errorUploadOrDeleteImage
          : errorUploadOrDeleteImage // ignore: cast_nullable_to_non_nullable
              as String?,
      hasChangeSomeField: freezed == hasChangeSomeField
          ? _self.hasChangeSomeField
          : hasChangeSomeField // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
