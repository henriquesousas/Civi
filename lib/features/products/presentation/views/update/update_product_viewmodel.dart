import 'package:deehelp/core/handlers/handle_command.dart';
import 'package:deehelp/core/handlers/handler_error.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/domain/usecases/update/update_product_usecase.dart';
import 'package:deehelp/features/products/presentation/views/update/product_update_manager.dart';
import 'package:deehelp/features/products/presentation/views/update/state/product_update_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateProductViewmodel extends StateNotifier<ProductUpdateState> {
  final UpdateProductUseCase _updateProductUseCase;
  Product? _product;
  UpdateProductViewmodel({required UpdateProductUseCase updateProductUseCase})
      : _updateProductUseCase = updateProductUseCase,
        super(ProductUpdateState.initial());

  void initialize(Product product) {
    _product = product;
    state = ProductUpdateState.setup(product);
  }

  void restart() {
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
    // if (!hasChanges) {
    //   state = state.copyWith(isLoading: false, isSuccess: true);
    //   return;
    // }
    if (state.currentProduct == null) return;

    await HandleCommand.execute<Unit, ProductUpdateState>(
      updateState: (newState) => state = newState,
      command: () => _updateProductUseCase.execute(state.currentProduct!),
      onLoading: () => state.copyWith(isLoading: true),
      onSuccess: (_) {
        return state.copyWith(
          isLoading: false,
          isSuccess: true,
          currentProduct: state.currentProduct!,
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

  void deleteImage() {}

  void onValueChange(
    ProductField field,
    String value, {
    bool executeUpdate = false,
  }) {
    final _updateManager = ProductUpdateManager();
    if (state.currentProduct == null) return;

    final error = _updateManager.validateField(field, value);

    state = state.copyWith(
      updateValue: value,
      errorValidation: error,
      hasChangeSomeField: true,
    );

    if (error == null) {
      _product = _updateManager.updateField(
        product: state.currentProduct!,
        field: field,
        value: value,
      );
    }

    if (executeUpdate) {
      modalConfirm();
    }
  }

  void modalConfirm() {
    if (_product == null) return;
    state = state.copyWith(currentProduct: _product);
  }

  void removePhoto(int index) {
    if (_product == null) return;
    _product!.removeImage(index);
    state = state.copyWith(currentProduct: _product);

    deleteImage();
  }
}
