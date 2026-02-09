import 'package:app_feature/app_feature.dart';
import 'package:go_router/go_router.dart';

class FaqPageRouter {
  static const String path = '/faq';
  FaqPageRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          builder: (_, __) => const FaqPage(),
        ),
      ];
}
