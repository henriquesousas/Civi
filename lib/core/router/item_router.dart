import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/features/products/presentation/views/add/add_product_success_page.dart';
import 'package:deehelp/features/products/presentation/views/listing/product_listing_page.dart';
import 'package:deehelp/features/products/presentation/views/add/add_product_page.dart';
import 'package:go_router/go_router.dart';

final itemRoutes = [
  GoRoute(
    path: RouterConstant.myItems,
    pageBuilder: (context, state) {
      return slideTransitionPage(
        key: state.pageKey,
        child: const ProductListingPage(),
      );
    },
  ),
  GoRoute(
    path: RouterConstant.createNewItem,
    pageBuilder: (context, state) => slideTransitionPage(
      key: state.pageKey,
      child: const AddProductPage(),
    ),
  ),
  // GoRoute(
  //   path: RouterConstant.itemEdit,
  //   pageBuilder: (context, state) {
  //     final Product? item = state.extra as Product?;
  //     if (item == null) {
  //       return slideTransitionPage(
  //           key: state.pageKey,
  //           child: const Scaffold(
  //             body: Center(
  //               child: Text("Item não encontrado..."),
  //             ),
  //           ));
  //     }

  //     return slideTransitionPage(
  //       key: state.pageKey,
  //       child: UpdateProductProvider(item: item),
  //     );
  //   },
  // ),
  GoRoute(
    path: RouterConstant.itemRegisterSuccess,
    pageBuilder: (context, state) => slideTransitionPage(
      key: state.pageKey,
      child: const AddProductSuccessPage(),
    ),
  ),
];
