import 'package:app_feature/app_feature.dart';
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
