import 'package:deehelp/feature/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

class SplashRouter {
  static const String path = '/splash';
  SplashRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          builder: (_, __) => const SplashPage(),
        ),
      ];
}
