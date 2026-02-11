import 'package:deehelp/old_features/products/domain/entities/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_update_state.freezed.dart';

@freezed
abstract class ProductUpdateState with _$ProductUpdateState {
  const factory ProductUpdateState({
    @Default(false) bool isLoading,
    @Default(false) bool addingPhoto,
    @Default(false) bool deletingProduct,
    @Default(false) bool isSuccess,
    Product? currentProduct,
    String? updateValue,
    String? errorValidation,
    String? errorMessage,
    String? successMessage,
    @Default(false) hasChangeSomeField,
  }) = _ProductUpdateState;

  factory ProductUpdateState.initial() => const ProductUpdateState();
  factory ProductUpdateState.setup(Product product) =>
      ProductUpdateState(currentProduct: product);
}
