import 'package:deehelp/old_core/handlers/handle_command.dart';
import 'package:deehelp/old_core/handlers/handler_error.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/module/item/domain/usecases/add/dtos/add_image_dto.dart';
import 'package:deehelp/module/item/domain/usecases/add/add_image_usecase.dart';
import 'package:deehelp/module/item/domain/usecases/delete/delete_image_usecase.dart';
import 'package:deehelp/module/item/domain/usecases/delete/delete_product_usecase.dart';
import 'package:deehelp/module/item/domain/usecases/delete/dtos/delete_image_dto.dart';
import 'package:deehelp/module/item/domain/usecases/update/update_product_usecase.dart';
import 'package:deehelp/feature/items/detail/viewmodel/item_update_manager.dart';
import 'package:deehelp/feature/items/detail/viewmodel/product_update_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateProductViewmodel extends StateNotifier<ProductUpdateState> {
  final UpdateProductUseCase _updateProductUseCase;
  final DeleteImageUsecase _deleteImageUsecase;
  final AddImageUsecase _addImageUsecase;
  final DeleteProductUsecase _deleteProductUsecase;
  Product? _product;
  UpdateProductViewmodel({
    required UpdateProductUseCase updateProductUseCase,
    required DeleteImageUsecase deleteImageUsecase,
    required AddImageUsecase addImageUsecase,
    required DeleteProductUsecase deleteProductUsecase,
  })  : _updateProductUseCase = updateProductUseCase,
        _deleteImageUsecase = deleteImageUsecase,
        _addImageUsecase = addImageUsecase,
        _deleteProductUsecase = deleteProductUsecase,
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

  void updatreProduct() async {
    if (!state.hasChangeSomeField) return;
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
          successMessage: "Produto alterado com sucesso",
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

  void deleteProduct() async {
    if (state.currentProduct == null) return;

    await HandleCommand.execute<Unit, ProductUpdateState>(
      updateState: (newState) => state = newState,
      command: () => _deleteProductUsecase.execute(state.currentProduct!),
      onLoading: () => state.copyWith(
        deletingProduct: true,
        errorMessage: null,
      ),
      onSuccess: (_) {
        return state.copyWith(
          deletingProduct: false,
          isSuccess: true,
          currentProduct: state.currentProduct!,
          successMessage: "Produto removido com sucesso",
        );
      },
      onError: (error) {
        return handleError<ProductUpdateState>(
          error,
          (message, extra) {
            return state.copyWith(
              errorMessage: message,
              deletingProduct: false,
            );
          },
        );
      },
    );
  }

  void deletePhoto(int index) async {
    if (_product == null) return;
    final dto = DeleteImageDto(
      productId: _product!.id,
      image: _product!.images[index],
    );
    await HandleCommand.execute<Unit, ProductUpdateState>(
      updateState: (newState) => state = newState,
      command: () => _deleteImageUsecase.execute(dto),
      onLoading: () => state.copyWith(
        errorMessage: null,
      ),
      onSuccess: (_) {
        _product!.removeImage(index);
        return state.copyWith(
          currentProduct: _product!,
        );
      },
      onError: (error) {
        return handleError<ProductUpdateState>(
          error,
          (message, extra) {
            return state.copyWith(errorMessage: message);
          },
        );
      },
    );
  }

  void addPhoto(ImageMedia image) async {
    final dto = AddImageDto(image: image, product: _product!);
    await HandleCommand.execute<List<ImageMedia>, ProductUpdateState>(
      updateState: (newState) => state = newState,
      command: () => _addImageUsecase.execute(dto),
      onLoading: () => state.copyWith(addingPhoto: true, errorMessage: null),
      onSuccess: (currentImages) {
        _product!.images = currentImages;
        return state.copyWith(
          currentProduct: _product!,
          addingPhoto: false,
        );
      },
      onError: (error) {
        return handleError<ProductUpdateState>(
          error,
          (message, extra) {
            return state.copyWith(
              errorMessage: message,
              addingPhoto: false,
            );
          },
        );
      },
    );
  }

  void onValueChange(
    ItemField field,
    String value, {
    bool executeUpdate = false,
  }) {
    final updateManager = ItemUpdateManager();
    if (state.currentProduct == null) return;

    final error = updateManager.validateField(field, value);

    state = state.copyWith(
      updateValue: value,
      errorValidation: error,
      hasChangeSomeField: true,
    );

    if (error == null) {
      _product = updateManager.updateField(
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
}
