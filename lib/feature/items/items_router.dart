import 'package:deehelp/feature/items/list/item_list_page.dart';
import 'package:deehelp/feature/items/register/item_register_page_view.dart';
import 'package:go_router/go_router.dart';

class ItemsRouter {
  static const String list = '/list';
  static const String register = '/register';
  ItemsRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: list,
          builder: (_, __) => const ItemListPage(),
        ),
        GoRoute(
          path: register,
          builder: (_, __) => const ItemRegisterPageView(),
        ),
      ];
}
