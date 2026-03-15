import 'package:deehelp/feature/items/detail/edit_args.dart';
import 'package:deehelp/feature/items/detail/item_edit_field_page.dart';
import 'package:deehelp/feature/items/detail/item_detail_page.dart';
import 'package:deehelp/feature/items/detail/item_photo_update.dart';
import 'package:deehelp/feature/items/list/item_list_page.dart';
import 'package:deehelp/feature/items/register/presentation/item_register_page_view.dart';
import 'package:deehelp/feature/items/success/item_register_success_page.dart';
import 'package:deehelp/feature/profile/item_list_router_args.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:go_router/go_router.dart';

class ItemsRouter {
  static const String list = '/list';
  static const String register = '/register';
  static const String detail = '/detail';
  static const String detailField = '/detail-field';
  static const String success = '/success';
  static const String updatePhoto = '/photo-updated';
  ItemsRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: list,
          pageBuilder: (context, state) {
            final routerArgs = state.extra as ItemListRouteArgs?;

            return slideTransitionPage(
              key: state.pageKey,
              child: ItemListPage(
                args: routerArgs?.args,
                showBackButton: routerArgs?.showBackButton ?? false,
              ),
            );
          },
        ),
        GoRoute(
          path: register,
          pageBuilder: (context, state) {
            return slideTransitionPage(
              key: state.pageKey,
              child: const ItemRegisterPageView(),
            );
          },
        ),
        GoRoute(
          path: detail,
          pageBuilder: (context, state) {
            return slideTransitionPage(
              key: state.pageKey,
              child: const ItemDetailPage(),
            );
          },
        ),
        GoRoute(
          path: updatePhoto,
          pageBuilder: (context, state) {
            return slideTransitionPage(
              key: state.pageKey,
              child: const ItemPhotoUpdate(),
            );
          },
        ),
        GoRoute(
          path: detailField,
          pageBuilder: (context, state) {
            final EditFieldArgs args = state.extra as EditFieldArgs;
            return slideDownToUpPage(
              key: state.pageKey,
              child: ItemEditFieldPageV2(
                args: args,
              ),
            );
          },
        ),
        GoRoute(
          path: success,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const ItemRegisterSuccessPage(),
          ),
        ),
      ];
}
