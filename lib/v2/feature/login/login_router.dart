import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/v2/feature/login/presentation/login_page.dart';
import 'package:go_router/go_router.dart';

class LoginRouter {
  static const String path = '/login';
  LoginRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const LoginPage(),
          ),
        ),
      ];
}
