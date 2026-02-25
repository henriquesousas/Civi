import 'package:deehelp/feature/shell/app_shell_page.dart';
import 'package:go_router/go_router.dart';

class AppSheelRouter {
  static const String path = '/main';
  AppSheelRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          builder: (_, __) => const AppShellPage(),
        ),
      ];
}
