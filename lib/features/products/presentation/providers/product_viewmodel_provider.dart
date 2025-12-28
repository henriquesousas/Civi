import 'package:deehelp/features/products/presentation/views/add/add_product_viewmodel.dart';
import 'package:deehelp/features/products/presentation/views/add/state/add_product_state.dart';
import 'package:deehelp/features/products/presentation/views/listing/product_listing_viewmodel.dart';
import 'package:deehelp/features/products/presentation/providers/product_usecase_provider.dart';
import 'package:deehelp/features/products/presentation/views/listing/state/list_product_state.dart';
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
