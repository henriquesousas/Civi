// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_product_form_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateProductFormContent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CreateProductFormContent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CreateProductFormContent()';
  }
}

/// @nodoc
class $CreateProductFormContentCopyWith<$Res> {
  $CreateProductFormContentCopyWith(
      CreateProductFormContent _, $Res Function(CreateProductFormContent) __);
}

/// Adds pattern-matching-related methods to [CreateProductFormContent].
extension CreateProductFormContentPatterns on CreateProductFormContent {
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
    TResult Function(_CreateProductFormContentInitial value)? initial,
    TResult Function(_CreateProductFormContentInfoProduct value)? infoProduct,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateProductFormContentInitial() when initial != null:
        return initial(_that);
      case _CreateProductFormContentInfoProduct() when infoProduct != null:
        return infoProduct(_that);
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
    required TResult Function(_CreateProductFormContentInitial value) initial,
    required TResult Function(_CreateProductFormContentInfoProduct value)
        infoProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _CreateProductFormContentInitial():
        return initial(_that);
      case _CreateProductFormContentInfoProduct():
        return infoProduct(_that);
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
    TResult? Function(_CreateProductFormContentInitial value)? initial,
    TResult? Function(_CreateProductFormContentInfoProduct value)? infoProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _CreateProductFormContentInitial() when initial != null:
        return initial(_that);
      case _CreateProductFormContentInfoProduct() when infoProduct != null:
        return infoProduct(_that);
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
            String productName,
            String productModel,
            String licensePlate,
            int year,
            String? productNameError,
            String? productModelError,
            String? licensePlateError,
            String? yearError,
            bool isFormValid)?
        infoProduct,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateProductFormContentInitial() when initial != null:
        return initial();
      case _CreateProductFormContentInfoProduct() when infoProduct != null:
        return infoProduct(
            _that.productName,
            _that.productModel,
            _that.licensePlate,
            _that.year,
            _that.productNameError,
            _that.productModelError,
            _that.licensePlateError,
            _that.yearError,
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
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String productName,
            String productModel,
            String licensePlate,
            int year,
            String? productNameError,
            String? productModelError,
            String? licensePlateError,
            String? yearError,
            bool isFormValid)
        infoProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _CreateProductFormContentInitial():
        return initial();
      case _CreateProductFormContentInfoProduct():
        return infoProduct(
            _that.productName,
            _that.productModel,
            _that.licensePlate,
            _that.year,
            _that.productNameError,
            _that.productModelError,
            _that.licensePlateError,
            _that.yearError,
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            String productName,
            String productModel,
            String licensePlate,
            int year,
            String? productNameError,
            String? productModelError,
            String? licensePlateError,
            String? yearError,
            bool isFormValid)?
        infoProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _CreateProductFormContentInitial() when initial != null:
        return initial();
      case _CreateProductFormContentInfoProduct() when infoProduct != null:
        return infoProduct(
            _that.productName,
            _that.productModel,
            _that.licensePlate,
            _that.year,
            _that.productNameError,
            _that.productModelError,
            _that.licensePlateError,
            _that.yearError,
            _that.isFormValid);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CreateProductFormContentInitial implements CreateProductFormContent {
  const _CreateProductFormContentInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateProductFormContentInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CreateProductFormContent.initial()';
  }
}

/// @nodoc

class _CreateProductFormContentInfoProduct implements CreateProductFormContent {
  const _CreateProductFormContentInfoProduct(
      {this.productName = '',
      this.productModel = '',
      this.licensePlate = '',
      this.year = 0,
      this.productNameError,
      this.productModelError,
      this.licensePlateError,
      this.yearError,
      this.isFormValid = false});

// Valores dos Campos
  @JsonKey()
  final String productName;
  @JsonKey()
  final String productModel;
  @JsonKey()
  final String licensePlate;
// Placa
  @JsonKey()
  final int year;
// Ano
// Erros dos Campos (usando String? para indicar ausência de erro com null)
  final String? productNameError;
  final String? productModelError;
  final String? licensePlateError;
// Erro da Placa
  final String? yearError;
// Erro do Ano
  @JsonKey()
  final bool isFormValid;

  /// Create a copy of CreateProductFormContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateProductFormContentInfoProductCopyWith<
          _CreateProductFormContentInfoProduct>
      get copyWith => __$CreateProductFormContentInfoProductCopyWithImpl<
          _CreateProductFormContentInfoProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateProductFormContentInfoProduct &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productModel, productModel) ||
                other.productModel == productModel) &&
            (identical(other.licensePlate, licensePlate) ||
                other.licensePlate == licensePlate) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.productNameError, productNameError) ||
                other.productNameError == productNameError) &&
            (identical(other.productModelError, productModelError) ||
                other.productModelError == productModelError) &&
            (identical(other.licensePlateError, licensePlateError) ||
                other.licensePlateError == licensePlateError) &&
            (identical(other.yearError, yearError) ||
                other.yearError == yearError) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      productName,
      productModel,
      licensePlate,
      year,
      productNameError,
      productModelError,
      licensePlateError,
      yearError,
      isFormValid);

  @override
  String toString() {
    return 'CreateProductFormContent.infoProduct(productName: $productName, productModel: $productModel, licensePlate: $licensePlate, year: $year, productNameError: $productNameError, productModelError: $productModelError, licensePlateError: $licensePlateError, yearError: $yearError, isFormValid: $isFormValid)';
  }
}

/// @nodoc
abstract mixin class _$CreateProductFormContentInfoProductCopyWith<$Res>
    implements $CreateProductFormContentCopyWith<$Res> {
  factory _$CreateProductFormContentInfoProductCopyWith(
          _CreateProductFormContentInfoProduct value,
          $Res Function(_CreateProductFormContentInfoProduct) _then) =
      __$CreateProductFormContentInfoProductCopyWithImpl;
  @useResult
  $Res call(
      {String productName,
      String productModel,
      String licensePlate,
      int year,
      String? productNameError,
      String? productModelError,
      String? licensePlateError,
      String? yearError,
      bool isFormValid});
}

/// @nodoc
class __$CreateProductFormContentInfoProductCopyWithImpl<$Res>
    implements _$CreateProductFormContentInfoProductCopyWith<$Res> {
  __$CreateProductFormContentInfoProductCopyWithImpl(this._self, this._then);

  final _CreateProductFormContentInfoProduct _self;
  final $Res Function(_CreateProductFormContentInfoProduct) _then;

  /// Create a copy of CreateProductFormContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productName = null,
    Object? productModel = null,
    Object? licensePlate = null,
    Object? year = null,
    Object? productNameError = freezed,
    Object? productModelError = freezed,
    Object? licensePlateError = freezed,
    Object? yearError = freezed,
    Object? isFormValid = null,
  }) {
    return _then(_CreateProductFormContentInfoProduct(
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productModel: null == productModel
          ? _self.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as String,
      licensePlate: null == licensePlate
          ? _self.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      productNameError: freezed == productNameError
          ? _self.productNameError
          : productNameError // ignore: cast_nullable_to_non_nullable
              as String?,
      productModelError: freezed == productModelError
          ? _self.productModelError
          : productModelError // ignore: cast_nullable_to_non_nullable
              as String?,
      licensePlateError: freezed == licensePlateError
          ? _self.licensePlateError
          : licensePlateError // ignore: cast_nullable_to_non_nullable
              as String?,
      yearError: freezed == yearError
          ? _self.yearError
          : yearError // ignore: cast_nullable_to_non_nullable
              as String?,
      isFormValid: null == isFormValid
          ? _self.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
