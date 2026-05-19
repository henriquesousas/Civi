import 'package:deehelp/old_core/handlers/handler_error.dart';
import 'package:deehelp/old_core/handlers/handle_command.dart';
import 'package:deehelp/infra/_shared/connectivity/network_info.dart';
import 'package:deehelp/feature/items/list/list_product_state.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/module/item/domain/usecases/listing/get_products_by_user_usecase.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class ItemListViewModel extends StateNotifier<ListProductState> {
  final GetProductsByUserUsecase _getProductsByUserUsecase;
  final NetworkInfo _networkInfo;
  List<Product> _cacheProducts = [];
  bool loadFirstTime = true;
  ItemListViewModel({
    required GetProductsByUserUsecase getProductsByUserUsecase,
    required NetworkInfo networkInfo,
  })  : _getProductsByUserUsecase = getProductsByUserUsecase,
        _networkInfo = networkInfo,
        super(const ListProductState.initial());

  void clear() {
    // state = const ListProductState.empty();
  }

  Future<void> getProducts(String userId, {bool fetchData = false}) async {
    if (!fetchData) {
      if (_cacheProducts.isNotEmpty) return;
    }

    //Verificar se tem internet
    final connection = await _networkInfo.hasConnection;
    if (!connection) {
      state = const ListProductState.noInternet();
      return;
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
