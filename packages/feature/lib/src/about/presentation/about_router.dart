import 'package:app_feature/src/about/about_page.dart';
import 'package:go_router/go_router.dart';

class AboutRouter {
  static const String path = '/about';
  AboutRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          builder: (_, __) => const AboutPage(),
        ),
      ];
}
