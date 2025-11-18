import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/features/itens/presentation/create/create_item_provider.dart';
import 'package:deehelp/features/itens/presentation/create/create_success_page.dart';
import 'package:deehelp/features/itens/presentation/edit/item_edit_page.dart';
import 'package:deehelp/features/itens/presentation/list/list_product_provider.dart';
import 'package:go_router/go_router.dart';

final itemRoutes = [
  GoRoute(
    path: RouterConstant.myItems,
    pageBuilder: (context, state) => slideTransitionPage(
      key: state.pageKey,
      child: const ListProductProvider(),
    ),
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
    pageBuilder: (context, state) => slideTransitionPage(
      key: state.pageKey,
      child: const ItemEditPage(),
    ),
  ),
  GoRoute(
    path: RouterConstant.itemRegisterSuccess,
    pageBuilder: (context, state) => slideTransitionPage(
      key: state.pageKey,
      child: const CreateSuccessPage(),
    ),
  ),
];
