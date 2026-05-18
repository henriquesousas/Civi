import 'package:deehelp/old_core/router/slide_transition_page.dart';
import 'package:go_router/go_router.dart';
import '../../../ui/auth/auth_page.dart';

class AuthRouter {
  static const String path = '/auth';
  AuthRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const AuthPage(),
          ),
        ),
      ];
}
