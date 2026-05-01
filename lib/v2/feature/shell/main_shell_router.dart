import 'package:deehelp/v2/feature/shell/main_shell_page.dart';
import 'package:go_router/go_router.dart';

class MainShellRouter {
  static const String path = '/';
  MainShellRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          builder: (_, __) => const MainShellPage(),
        ),
      ];
}
