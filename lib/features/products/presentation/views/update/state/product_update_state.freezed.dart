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
  bool get addingPhoto;
  bool get isSuccess;
  Product? get currentProduct;
  String? get updateValue;
  String? get errorValidation;
  String? get errorMessage;
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
            (identical(other.addingPhoto, addingPhoto) ||
                other.addingPhoto == addingPhoto) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.currentProduct, currentProduct) ||
                other.currentProduct == currentProduct) &&
            (identical(other.updateValue, updateValue) ||
                other.updateValue == updateValue) &&
            (identical(other.errorValidation, errorValidation) ||
                other.errorValidation == errorValidation) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other.hasChangeSomeField, hasChangeSomeField));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      addingPhoto,
      isSuccess,
      currentProduct,
      updateValue,
      errorValidation,
      errorMessage,
      const DeepCollectionEquality().hash(hasChangeSomeField));

  @override
  String toString() {
    return 'ProductUpdateState(isLoading: $isLoading, addingPhoto: $addingPhoto, isSuccess: $isSuccess, currentProduct: $currentProduct, updateValue: $updateValue, errorValidation: $errorValidation, errorMessage: $errorMessage, hasChangeSomeField: $hasChangeSomeField)';
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
      bool addingPhoto,
      bool isSuccess,
      Product? currentProduct,
      String? updateValue,
      String? errorValidation,
      String? errorMessage,
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
    Object? addingPhoto = null,
    Object? isSuccess = null,
    Object? currentProduct = freezed,
    Object? updateValue = freezed,
    Object? errorValidation = freezed,
    Object? errorMessage = freezed,
    Object? hasChangeSomeField = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      addingPhoto: null == addingPhoto
          ? _self.addingPhoto
          : addingPhoto // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
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
            bool addingPhoto,
            bool isSuccess,
            Product? currentProduct,
            String? updateValue,
            String? errorValidation,
            String? errorMessage,
            dynamic hasChangeSomeField)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductUpdateState() when $default != null:
        return $default(
            _that.isLoading,
            _that.addingPhoto,
            _that.isSuccess,
            _that.currentProduct,
            _that.updateValue,
            _that.errorValidation,
            _that.errorMessage,
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
            bool addingPhoto,
            bool isSuccess,
            Product? currentProduct,
            String? updateValue,
            String? errorValidation,
            String? errorMessage,
            dynamic hasChangeSomeField)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUpdateState():
        return $default(
            _that.isLoading,
            _that.addingPhoto,
            _that.isSuccess,
            _that.currentProduct,
            _that.updateValue,
            _that.errorValidation,
            _that.errorMessage,
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
            bool addingPhoto,
            bool isSuccess,
            Product? currentProduct,
            String? updateValue,
            String? errorValidation,
            String? errorMessage,
            dynamic hasChangeSomeField)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductUpdateState() when $default != null:
        return $default(
            _that.isLoading,
            _that.addingPhoto,
            _that.isSuccess,
            _that.currentProduct,
            _that.updateValue,
            _that.errorValidation,
            _that.errorMessage,
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
      this.addingPhoto = false,
      this.isSuccess = false,
      this.currentProduct,
      this.updateValue,
      this.errorValidation,
      this.errorMessage,
      this.hasChangeSomeField = false});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool addingPhoto;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final Product? currentProduct;
  @override
  final String? updateValue;
  @override
  final String? errorValidation;
  @override
  final String? errorMessage;
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
            (identical(other.addingPhoto, addingPhoto) ||
                other.addingPhoto == addingPhoto) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.currentProduct, currentProduct) ||
                other.currentProduct == currentProduct) &&
            (identical(other.updateValue, updateValue) ||
                other.updateValue == updateValue) &&
            (identical(other.errorValidation, errorValidation) ||
                other.errorValidation == errorValidation) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other.hasChangeSomeField, hasChangeSomeField));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      addingPhoto,
      isSuccess,
      currentProduct,
      updateValue,
      errorValidation,
      errorMessage,
      const DeepCollectionEquality().hash(hasChangeSomeField));

  @override
  String toString() {
    return 'ProductUpdateState(isLoading: $isLoading, addingPhoto: $addingPhoto, isSuccess: $isSuccess, currentProduct: $currentProduct, updateValue: $updateValue, errorValidation: $errorValidation, errorMessage: $errorMessage, hasChangeSomeField: $hasChangeSomeField)';
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
      bool addingPhoto,
      bool isSuccess,
      Product? currentProduct,
      String? updateValue,
      String? errorValidation,
      String? errorMessage,
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
    Object? addingPhoto = null,
    Object? isSuccess = null,
    Object? currentProduct = freezed,
    Object? updateValue = freezed,
    Object? errorValidation = freezed,
    Object? errorMessage = freezed,
    Object? hasChangeSomeField = freezed,
  }) {
    return _then(_ProductUpdateState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      addingPhoto: null == addingPhoto
          ? _self.addingPhoto
          : addingPhoto // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
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
      hasChangeSomeField: freezed == hasChangeSomeField
          ? _self.hasChangeSomeField
          : hasChangeSomeField // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
