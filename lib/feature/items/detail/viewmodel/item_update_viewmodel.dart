import 'package:deehelp/feature/items/detail/provider/selected_item_provider.dart';
import 'package:deehelp/core/handlers/handle_command.dart';
import 'package:deehelp/core/handlers/handler_error.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/module/item/domain/usecases/add/dtos/add_image_dto.dart';
import 'package:deehelp/module/item/domain/usecases/add/add_image_usecase.dart';
import 'package:deehelp/module/item/domain/usecases/delete/delete_image_usecase.dart';
import 'package:deehelp/module/item/domain/usecases/delete/delete_product_usecase.dart';
import 'package:deehelp/module/item/domain/usecases/delete/dtos/delete_image_dto.dart';
import 'package:deehelp/module/item/domain/usecases/update/update_product_usecase.dart';
import 'package:deehelp/feature/items/detail/viewmodel/item_update_manager.dart';
import 'package:deehelp/feature/items/detail/viewmodel/product_update_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemUpdateViewmodel extends StateNotifier<ProductUpdateState> {
  final UpdateProductUseCase _updateProductUseCase;
  final DeleteImageUsecase _deleteImageUsecase;
  final AddImageUsecase _addImageUsecase;
  final DeleteProductUsecase _deleteProductUsecase;
  final Ref ref;
  final String productId;

  ItemUpdateViewmodel({
    required UpdateProductUseCase updateProductUseCase,
    required DeleteImageUsecase deleteImageUsecase,
    required AddImageUsecase addImageUsecase,
    required DeleteProductUsecase deleteProductUsecase,
    required this.productId,
    required this.ref,
  })  : _updateProductUseCase = updateProductUseCase,
        _deleteImageUsecase = deleteImageUsecase,
        _addImageUsecase = addImageUsecase,
        _deleteProductUsecase = deleteProductUsecase,
        super(ProductUpdateState.initial()) {
    final selected = ref.read(selectedItemProvider);
    if (selected != null && selected.id.value == productId) {
      state = state.copyWith(currentProduct: selected);
    }
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
    state = state.copyWith(
      errorMessage: null,
      errorValidation: null,
      hasChangeSomeField: false,
    );
  }

  void updatreProduct({ItemField? field}) async {
    if (!state.hasChangeSomeField) return;
    if (state.currentProduct == null) return;

    await HandleCommand.execute<Unit, ProductUpdateState>(
      updateState: (newState) => state = newState,
      command: () => _updateProductUseCase.execute(state.currentProduct!),
      onLoading: () => state.copyWith(
        isLoading: true,
        errorMessage: null,
        errorValidation: null,
        yearUpdateLoad: field == ItemField.year,
        brandUpdateLoad: field == ItemField.brand,
        colorUpdateLoad: field == ItemField.color,
      ),
      onSuccess: (_) {
        return state.copyWith(
          isLoading: false,
          isSuccess: true,
          yearUpdateLoad: false,
          brandUpdateLoad: false,
          colorUpdateLoad: false,
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
              yearUpdateLoad: false,
              brandUpdateLoad: false,
              colorUpdateLoad: false,
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
          deleteSuccess: true,
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
    final product = state.currentProduct;
    if (product == null) return;

    if (index < 0 || index >= product.images.length) return;

    final dto = DeleteImageDto(
      productId: product.id,
      image: product.images[index],
    );

    await HandleCommand.execute<Unit, ProductUpdateState>(
      updateState: (newState) => state = newState,
      command: () => _deleteImageUsecase.execute(dto),
      onLoading: () => state.copyWith(
        errorMessage: null,
        errorUploadOrDeleteImage: null,
        deleteImageSuccess: false,
        isLoading: true,
        currentProduct: state.currentProduct,
        removeImageIndex: index,
      ),
      onSuccess: (_) {
        final current = state.currentProduct ?? product;
        final updated = current.removeImage(index);
        return state.copyWith(
          currentProduct: updated,
          deleteImageSuccess: true,
          isLoading: false,
          removeImageIndex: -1,
        );
      },
      onError: (error) {
        return handleError<ProductUpdateState>(
          error,
          (message, extra) {
            return state.copyWith(
              errorUploadOrDeleteImage: message,
              deleteImageSuccess: false,
              isLoading: false,
              removeImageIndex: -1,
            );
          },
        );
      },
    );
  }

  void addPhoto(ImageMedia image) async {
    final dto = AddImageDto(image: image, product: state.currentProduct!);
    await HandleCommand.execute<List<ImageMedia>, ProductUpdateState>(
      updateState: (newState) => state = newState,
      command: () => _addImageUsecase.execute(dto),
      onLoading: () => state.copyWith(
        addingPhoto: true,
        errorMessage: null,
        errorUploadOrDeleteImage: null,
      ),
      onSuccess: (currentImages) {
        state.currentProduct!.images = currentImages;
        return state.copyWith(
          currentProduct: state.currentProduct!,
          addingPhoto: false,
        );
      },
      onError: (error) {
        return handleError<ProductUpdateState>(
          error,
          (message, extra) {
            return state.copyWith(
              errorMessage: message,
              errorUploadOrDeleteImage: message,
              addingPhoto: false,
            );
          },
        );
      },
    );
  }

  void onValueChange(
    ItemField field,
    String value,
    String originalValue, {
    bool executeUpdate = false,
  }) {
    if (value.isEmpty) {
      state = state.copyWith(
        updateValue: value,
        errorValidation: null,
        hasChangeSomeField: false,
      );
      return;
    }

    final updateManager = ItemUpdateManager();
    if (state.currentProduct == null) return;

    final error = updateManager.validateField(field, value);
    final hasChanged = originalValue != value;

    state = state.copyWith(
      updateValue: value,
      errorValidation: error,
      hasChangeSomeField: hasChanged,
    );

    if (error == null) {
      final product = updateManager.updateField(
        product: state.currentProduct!,
        field: field,
        value: value,
      );
      state = state.copyWith(currentProduct: product);
    }

    if (executeUpdate) {
      updatreProduct(field: field);
    }
  }
}
