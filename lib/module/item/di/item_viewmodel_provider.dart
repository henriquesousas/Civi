import 'package:deehelp/old_core/services/network/network_info_provider.dart';
import 'package:deehelp/feature/items/register/viewmodel/register_item_viewmodel.dart';
import 'package:deehelp/feature/items/register/viewmodel/add_product_state.dart';
import 'package:deehelp/feature/items/list/item_list_viewmodel.dart';
import 'package:deehelp/module/item/di/product_usecase_provider.dart';
import 'package:deehelp/feature/items/list/list_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final itemListViewmodelProvider =
    StateNotifierProvider.autoDispose<ItemListViewModel, ListProductState>(
  (ref) {
    final usecase = ref.watch(getProductsByUserUsecaseProvider);
    final netInfo = ref.watch(networkInfoProvider);
    ref.onDispose(() {
      debugPrint('productListingViewmodelProvider disposed');
    });
    return ItemListViewModel(
        getProductsByUserUsecase: usecase, networkInfo: netInfo);
  },
);

final registerItemViewModelProvider =
    StateNotifierProvider.autoDispose<RegisterItemViewmodel, AddProductState>(
  (ref) {
    final usecase = ref.watch(addProductUsecaseProvider);
    final itemValidateUseCase = ref.watch(getItemByCodeUsecaseProvider);
    return RegisterItemViewmodel(
        addProductUseCase: usecase, itemValidateUseCase: itemValidateUseCase);
  },
);

// final updateProductViewModelProvider = StateNotifierProvider.autoDispose<
//     UpdateProductViewmodel, ProductUpdateState>(
//   (ref) {
//     final updateProductUsecase = ref.watch(updateProductUsecaseProvider);
//     final deleteImageUseCase = ref.watch(deleteImageUsecaseProvider);
//     final addImageUseCase = ref.watch(addImageUsecaseProvider);
//     final deleteProductUseCase = ref.watch(deleteProductUsecaseProvider);
//     return UpdateProductViewmodel(
//         updateProductUseCase: updateProductUsecase,
//         deleteImageUsecase: deleteImageUseCase,
//         addImageUsecase: addImageUseCase,
//         deleteProductUsecase: deleteProductUseCase);
//   },
// );
