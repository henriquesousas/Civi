import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/my_products/domain/entities/product.dart';
import '../../features/my_products/presentation/create/create_item_provider.dart';
import '../../features/my_products/presentation/create/create_success_page.dart';
import '../../features/my_products/presentation/listing/listing_my_products_provider.dart';
import '../../features/my_products/presentation/update/update_product_provider.dart';

final itemRoutes = [
  GoRoute(
    path: RouterConstant.myItems,
    pageBuilder: (context, state) {
      final showBackButton = state.extra == null ? false : state.extra as bool;
      return slideTransitionPage(
        key: state.pageKey,
        child: ListingMyProductsProvider(showBackButton: showBackButton),
      );
    },
  ),
  GoRoute(
    path: RouterConstant.createNewItem,
    pageBuilder: (context, state) => slideTransitionPage(
      key: state.pageKey,
      child: const CreateItemProvider(),
    ),
  ),
  GoRoute(
    path: RouterConstant.itemEdit,
    pageBuilder: (context, state) {
      final Product? item = state.extra as Product?;
      if (item == null) {
        return slideTransitionPage(
            key: state.pageKey,
            child: const Scaffold(
              body: Center(
                child: Text("Item não encontrado..."),
              ),
            ));
      }

      return slideTransitionPage(
        key: state.pageKey,
        child: UpdateProductProvider(item: item),
      );
    },
  ),
  GoRoute(
    path: RouterConstant.itemRegisterSuccess,
    pageBuilder: (context, state) => slideTransitionPage(
      key: state.pageKey,
      child: const CreateSuccessPage(),
    ),
  ),
];
