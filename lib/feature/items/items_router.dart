import 'package:deehelp/feature/items/detail/item_detail_page.dart';
import 'package:deehelp/feature/items/list/item_list_page.dart';
import 'package:deehelp/feature/items/register/item_register_page_view.dart';
import 'package:deehelp/feature/items/success/item_register_success_page.dart';
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
          builder: (_, __) => const ItemListPage(),
        ),
        GoRoute(
          path: register,
          builder: (_, __) => const ItemRegisterPageView(),
        ),
        GoRoute(
          path: detail,
          builder: (_, __) => const ItemDetailPage(),
        ),
        GoRoute(
          path: success,
          builder: (_, __) => const ItemRegisterSuccessPage(),
        ),
      ];
}
