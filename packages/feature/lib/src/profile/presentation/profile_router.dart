import 'package:app_feature/src/profile/presentation/profile_page.dart';
import 'package:go_router/go_router.dart';

class ProfileRouter {
  static const String path = '/profile';
  ProfileRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          builder: (_, __) => const ProfilePage(),
        ),
      ];
}
