import 'home_page.dart';
import 'package:go_router/go_router.dart';

class HomeRouter {
  static const String path = '/home';
  HomeRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          builder: (_, __) => const HomePage(),
        ),
      ];
}
