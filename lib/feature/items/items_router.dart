import 'package:deehelp/feature/items/detail/item_detail_page.dart';
import 'package:deehelp/feature/items/list/item_list_page.dart';
import 'package:deehelp/feature/items/register/item_register_page_view.dart';
import 'package:deehelp/feature/items/success/item_register_success_page.dart';
import 'package:deehelp/old_core/ui/router/slide_transition_page.dart';
import 'package:go_router/go_router.dart';

class ItemsRouter {
  static const String list = '/list';
  static const String register = '/register';
  static const String detail = '/detail';
  static const String success = '/success';
  ItemsRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: list,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const ItemListPage(),
          ),
        ),
        GoRoute(
          path: register,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const ItemRegisterPageView(),
          ),
        ),
        GoRoute(
          path: detail,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const ItemDetailPage(),
          ),
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
