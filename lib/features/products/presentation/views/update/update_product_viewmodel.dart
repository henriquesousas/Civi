import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/domain/usecases/update/update_product_usecase.dart';
import 'package:deehelp/features/products/presentation/views/update/state/product_update_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateProductViewmodel extends StateNotifier<ProductUpdateState> {
  final UpdateProductUseCase _updateProductUseCase;
  UpdateProductViewmodel({required UpdateProductUseCase updateProductUseCase})
      : _updateProductUseCase = updateProductUseCase,
        super(ProductUpdateState.initial());

  void setup(Product product) {
    state = ProductUpdateState.setup(product);
  }

  void onModelChange(String value) {
    final isError = value.length > 3 ? null : "Modelo inválido";
    state = state.copyWith(
      model: value,
      errorModel: isError,
    );
  }
}
