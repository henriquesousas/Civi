import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_update_state.freezed.dart';

@freezed
abstract class ProductUpdateState with _$ProductUpdateState {
  const factory ProductUpdateState({
    @Default(false) bool isLoading,
    @Default(false) bool yearUpdateLoad,
    @Default(false) bool brandUpdateLoad,
    @Default(false) bool colorUpdateLoad,
    @Default(false) bool addingPhoto,
    @Default(false) bool deletingProduct,
    @Default(false) bool isSuccess,
    @Default(false) bool deleteSuccess,
    @Default(false) bool deleteImageSuccess,
    @Default(-1) int removeImageIndex,
    Product? currentProduct,
    String? updateValue,
    String? errorValidation,
    String? errorMessage,
    String? successMessage,
    String? errorUploadOrDeleteImage,
    @Default(false) hasChangeSomeField,
  }) = _ProductUpdateState;

  factory ProductUpdateState.initial() => const ProductUpdateState();
  factory ProductUpdateState.setup(Product product) =>
      ProductUpdateState(currentProduct: product);
}
