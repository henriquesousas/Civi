import 'package:deehelp/old_core/handlers/handler_error.dart';
import 'package:deehelp/old_core/handlers/handle_command.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/module/item/domain/usecases/listing/get_products_by_user_usecase.dart';
import 'package:deehelp/feature/items/list/item_list_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemListViewModel extends StateNotifier<ListProductState> {
  final GetProductsByUserUsecase _getProductsByUserUsecase;
  List<Product> _cacheProducts = [];
  ItemListViewModel(
      {required GetProductsByUserUsecase getProductsByUserUsecase})
      : _getProductsByUserUsecase = getProductsByUserUsecase,
        super(const ListProductState.initial());

  void clear() {
    state = const ListProductState.empty();
  }

  void getProducts(String userId, {bool fetchData = false}) {
    if (!fetchData) {
      if (_cacheProducts.isNotEmpty) return;
    }
    HandleCommand.execute<List<Product>, ListProductState>(
      updateState: (newState) => state = newState,
      command: () async => await _getProductsByUserUsecase.execute(userId),
      onLoading: () => const ListProductState.loading(),
      onSuccess: (products) {
        _cacheProducts = products;
        return products.isNotEmpty
            ? ListProductState.success(_cacheProducts, "All")
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

  void removeAt(Product product) {
    final index = _cacheProducts.indexWhere((inc) => inc.id == product.id);
    if (index != -1) {
      _cacheProducts.removeAt(index);
      state = _cacheProducts.isNotEmpty
          ? ListProductState.success(_cacheProducts, "All")
          : const ListProductState.empty();
    }
  }
}
