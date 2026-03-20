import 'package:deehelp/feature/items/detail/viewmodel/item_update_viewmodel.dart';
import 'package:deehelp/feature/items/detail/viewmodel/product_update_state.dart';
import 'package:deehelp/module/item/di/product_usecase_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemUpdateViewmodelProvider = StateNotifierProvider.autoDispose
    .family<ItemUpdateViewmodel, ProductUpdateState, String>((ref, productId) {
  final addImageUsecase = ref.watch(addImageUsecaseProvider);
  final deleteImageUsecase = ref.watch(deleteImageUsecaseProvider);
  final deleteProductUsecase = ref.watch(deleteProductUsecaseProvider);
  final updateProductUseCase = ref.watch(updateProductUsecaseProvider);

  ref.onDispose(
    () {
      debugPrint("Item updade viewModel Disponse...");
    },
  );

  return ItemUpdateViewmodel(
      addImageUsecase: addImageUsecase,
      deleteImageUsecase: deleteImageUsecase,
      deleteProductUsecase: deleteProductUsecase,
      updateProductUseCase: updateProductUseCase,
      productId: productId,
      ref: ref);
});
