import 'package:dartz/dartz.dart';
import 'package:deehelp/core/wrapper/command_cubit.dart';
import 'package:deehelp/features/product/domain/usecases/update/update_product_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/image_media.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/product_exception.dart';
import 'product_update_state.dart';

class UpdateProductCubit extends Cubit<ProductUpdateState> {
  final UpdateProductUseCase _updateProductUseCase;

  UpdateProductCubit({
    required UpdateProductUseCase updateProductUseCase,
  })  : _updateProductUseCase = updateProductUseCase,
        super(const ProductUpdateState.initial());

  Future<void> load(Product item) async {
    emit(ProductUpdateState.load(item));
  }

  Future<void> update() async {
    final state = this.state;

    final product = state.maybeMap(
      load: (state) => state.product,
      orElse: () => null,
    );

    await CommandCubit.execute<Unit, ProductUpdateState>(
        emit: emit,
        command: () => _updateProductUseCase.execute(product!),
        onLoading: () => ProductUpdateState.editing(product!),
        onSuccess: (result) => const ProductUpdateState.success(),
        onError: (error) =>
            ProductUpdateState.error((error as ProductException).message));
  }

  Future<void> applyModelChange(String value) async {
    await _updateItem((item) => item.copyWith(name: value));
  }

  Future<void> applyObsChange(String value) async {
    await _updateItem((item) => item.copyWith(obs: value));
  }

  Future<void> applyBrandChange(String value) async {
    await _updateItem((item) => item.copyWith(brand: value));
  }

  Future<void> applyTypeChange(String value) async {
    await _updateItem((item) => item.copyWith(type: value));
  }

  Future<void> applyColorChange(String value) async {
    await _updateItem((item) => item.copyWith(color: value));
  }

  Future<void> applyImageChange(ImageMedia image) async {
    await _updateItem((item) => item.copyWith(image: image));
  }

  Future<void> _updateItem(Product Function(Product) fn) async {
    final state = this.state;

    final item = state.maybeMap(
      load: (loadState) => loadState.product,
      orElse: () => null,
    );

    if (item == null) return;

    final updatedItem = fn(item);
    emit(ProductUpdateState.load(updatedItem));
  }
}
