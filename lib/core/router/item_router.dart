import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/features/itens/presentation/create/create_item_provider.dart';
import 'package:deehelp/features/itens/presentation/create/create_success_page.dart';
import 'package:deehelp/features/itens/presentation/edit/item_edit_provider.dart';
import 'package:deehelp/features/itens/presentation/list/list_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/itens/domain/entities/my_items.dart';

final itemRoutes = [
  GoRoute(
      path: RouterConstant.myItems,
      pageBuilder: (context, state) {
        final bool showBackButton = state.extra as bool;
        return slideTransitionPage(
          key: state.pageKey,
          child: ListProductProvider(showBackButton: showBackButton),
        );
      }),
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
        final Item? item = state.extra as Item?;
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
          child: ItemEditProvider(item: item),
        );
      }),
  GoRoute(
    path: RouterConstant.itemRegisterSuccess,
    pageBuilder: (context, state) => slideTransitionPage(
      key: state.pageKey,
      child: const CreateSuccessPage(),
    ),
  ),
];
