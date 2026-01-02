import 'package:deehelp/core/handlers/handle_command.dart';
import 'package:deehelp/core/handlers/handler_error.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/domain/usecases/update/update_product_usecase.dart';
import 'package:deehelp/features/products/presentation/views/update/state/product_update_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateProductViewmodel extends StateNotifier<ProductUpdateState> {
  final UpdateProductUseCase _updateProductUseCase;
  Product? _product;
  bool hasChanges = false;
  UpdateProductViewmodel({required UpdateProductUseCase updateProductUseCase})
      : _updateProductUseCase = updateProductUseCase,
        super(ProductUpdateState.initial());

  void initialize(Product product) {
    _product = product;
    state = ProductUpdateState.setup(product);
  }

  void restart() {
    hasChanges = false;

    state = state.copyWith(
      isSuccess: false,
      isLoading: false,
      errorMessage: null,
      errorValidation: null,
    );
  }

  void clearErrorMessage() {
    state = state.copyWith(errorMessage: null);
  }

  void update() async {
    if (!hasChanges) {
      state = state.copyWith(isLoading: false, isSuccess: true);
      return;
    }
    if (_product == null) return;

    await HandleCommand.execute<Unit, ProductUpdateState>(
      updateState: (newState) => state = newState,
      command: () => _updateProductUseCase.execute(_product!),
      onLoading: () => state.copyWith(isLoading: true),
      onSuccess: (_) {
        return state.copyWith(
          isLoading: false,
          isSuccess: true,
          currentProduct: _product!,
        );
      },
      onError: (error) {
        return handleError<ProductUpdateState>(
          error,
          (message, extra) {
            return state.copyWith(
              errorMessage: message,
              isLoading: false,
            );
          },
        );
      },
    );
  }

  // Solução 6: Com registro dinâmico de campos
  void onValueChange(String value, String fieldName) {
    if (_product == null) return;
    hasChanges = true;

    final error = value.length > 3 ? null : 'Modelo inválido';
    state = state.copyWith(
      updateValue: value,
      errorValidation: error,
    );

    _product = _product!.changeModel(value);
  }
}
