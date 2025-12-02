import 'package:dartz/dartz.dart';
import 'package:deehelp/core/wrapper/command_cubit.dart';
import 'package:deehelp/features/my_products/domain/usecases/delete/delete_product_dto.dart';
import 'package:deehelp/features/my_products/domain/usecases/delete/delete_product_usecase.dart';
import 'package:deehelp/features/my_products/domain/usecases/update/update_product_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/image_media.dart';
import '../../domain/entities/product.dart';
import '../../domain/product_exception.dart';
import 'state/product_update_state.dart';

class UpdateProductCubit extends Cubit<ProductUpdateState> {
  final UpdateProductUseCase _updateProductUseCase;
  final DeleteProductUsecase _deleteProductUsecase;

  UpdateProductCubit({
    required UpdateProductUseCase updateProductUseCase,
    required DeleteProductUsecase deleteProductUseCase,
  })  : _updateProductUseCase = updateProductUseCase,
        _deleteProductUsecase = deleteProductUseCase,
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

    //TODO: Validar se o produto é null

    await CommandCubit.execute<Unit, ProductUpdateState>(
        emit: emit,
        command: () => _updateProductUseCase.execute(product!),
        onLoading: () => ProductUpdateState.editing(product!),
        onSuccess: (result) => ProductUpdateState.success(product!),
        onError: (error) =>
            ProductUpdateState.error((error as ProductException).message));
  }

  //TODO: Validar se UsuarioId é null
  Future<void> delete(Product product) async {
    emit(ProductUpdateState.deleting(product));
    return;
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {}

    final dto = DeleteProductDto(
      itemId: product.id.value,
      userId: userId!,
      imageUrl: product.image?.value ?? '',
    );

    await CommandCubit.execute<Unit, ProductUpdateState>(
        emit: emit,
        command: () => _deleteProductUsecase.execute(dto),
        onLoading: () => ProductUpdateState.editing(product),
        onSuccess: (result) => ProductUpdateState.deleting(product),
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
