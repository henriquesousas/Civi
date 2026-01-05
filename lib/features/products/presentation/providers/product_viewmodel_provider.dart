import 'package:deehelp/features/products/presentation/views/add/add_product_viewmodel.dart';
import 'package:deehelp/features/products/presentation/views/add/state/add_product_state.dart';
import 'package:deehelp/features/products/presentation/views/listing/product_listing_viewmodel.dart';
import 'package:deehelp/features/products/presentation/providers/product_usecase_provider.dart';
import 'package:deehelp/features/products/presentation/views/listing/state/list_product_state.dart';
import 'package:deehelp/features/products/presentation/views/update/state/product_update_state.dart';
import 'package:deehelp/features/products/presentation/views/update/update_product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productListingViewmodelProvider = StateNotifierProvider.autoDispose<
    ProductListingViewmodel, ListProductState>(
  (ref) {
    final usecase = ref.watch(getProductsByUserUsecaseProvider);
    ref.onDispose(() {
      debugPrint('productListingViewmodelProvider disposed');
    });
    return ProductListingViewmodel(getProductsByUserUsecase: usecase);
  },
);

final addProductViewModelProvider =
    StateNotifierProvider.autoDispose<AddProductViewmodel, AddProductState>(
  (ref) {
    final usecase = ref.watch(addProductUsecaseProvider);
    return AddProductViewmodel(
      addProductUseCase: usecase,
    );
  },
);

final updateProductViewModelProvider = StateNotifierProvider.autoDispose<
    UpdateProductViewmodel, ProductUpdateState>(
  (ref) {
    final updateProductUsecase = ref.watch(updateProductUsecaseProvider);
    final deleteImageUseCase = ref.watch(deleteImageUsecaseProvider);
    final addImageUseCase = ref.watch(addImageUsecaseProvider);
    final deleteProductUseCase = ref.watch(deleteProductUsecaseProvider);
    return UpdateProductViewmodel(
        updateProductUseCase: updateProductUsecase,
        deleteImageUsecase: deleteImageUseCase,
        addImageUsecase: addImageUseCase,
        deleteProductUsecase: deleteProductUseCase);
  },
);
