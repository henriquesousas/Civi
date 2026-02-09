import 'package:app_feature/src/auth/auth_page.dart';
import 'package:go_router/go_router.dart';

class AuthRouter {
  static const String path = '/auth';
  AuthRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          builder: (_, __) => const AuthPage(),
        ),
      ];
}
