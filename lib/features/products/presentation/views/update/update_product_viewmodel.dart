import 'package:deehelp/core/handlers/handle_command.dart';
import 'package:deehelp/core/handlers/handler_error.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/domain/usecases/add/dtos/add_image_dto.dart';
import 'package:deehelp/features/products/domain/usecases/add/add_image_usecase.dart';
import 'package:deehelp/features/products/domain/usecases/delete/delete_image_usecase.dart';
import 'package:deehelp/features/products/domain/usecases/delete/dtos/delete_image_dto.dart';
import 'package:deehelp/features/products/domain/usecases/update/update_product_usecase.dart';
import 'package:deehelp/features/products/presentation/views/update/product_update_manager.dart';
import 'package:deehelp/features/products/presentation/views/update/state/product_update_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateProductViewmodel extends StateNotifier<ProductUpdateState> {
  final UpdateProductUseCase _updateProductUseCase;
  final DeleteImageUsecase _deleteImageUsecase;
  final AddImageUsecase _addImageUsecase;
  Product? _product;
  UpdateProductViewmodel({
    required UpdateProductUseCase updateProductUseCase,
    required DeleteImageUsecase deleteImageUsecase,
    required AddImageUsecase addImageUsecase,
  })  : _updateProductUseCase = updateProductUseCase,
        _deleteImageUsecase = deleteImageUsecase,
        _addImageUsecase = addImageUsecase,
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
}
