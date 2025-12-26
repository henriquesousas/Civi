import 'package:deehelp/features/products/presentation/listing/product_listing_viewmodel.dart';
import 'package:deehelp/features/products/presentation/providers/product_usecase_provider.dart';
import 'package:deehelp/features/products/presentation/listing/state/list_product_state.dart';
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
