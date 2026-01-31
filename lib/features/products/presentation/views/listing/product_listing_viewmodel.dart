import 'package:deehelp/core/handlers/handler_error.dart';
import 'package:deehelp/core/handlers/handle_command.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/domain/usecases/listing/get_products_by_user_usecase.dart';
import 'package:deehelp/features/products/presentation/views/listing/state/list_product_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListingViewmodel extends StateNotifier<ListProductState> {
  final GetProductsByUserUsecase _getProductsByUserUsecase;
  ProductListingViewmodel(
      {required GetProductsByUserUsecase getProductsByUserUsecase})
      : _getProductsByUserUsecase = getProductsByUserUsecase,
        super(const ListProductState.initial());

  void getProducts(String userId) {
    HandleCommand.execute<List<Product>, ListProductState>(
      updateState: (newState) => state = newState,
      command: () async => await _getProductsByUserUsecase.execute(userId),
      onLoading: () => const ListProductState.loading(),
      onSuccess: (products) {
        return products.isNotEmpty
            ? ListProductState.success(products, "All")
            : const ListProductState.empty();
      },
      onError: (error) {
        return handleError<ListProductState>(
          error,
          (message, extra) {
            return ListProductState.error(message);
          },
        );
      },
    );
  }

  void refresh(Product product) {
    state.maybeMap(
      success: (value) {
        final index = value.items.indexWhere((p) => p.id == product.id);
        if (index != -1) {
          final updatedProducts = List<Product>.from(value.items);
          updatedProducts[index] = product;
          state = ListProductState.success(updatedProducts, "All");
        }
      },
      orElse: () => null,
    );
  }
}
