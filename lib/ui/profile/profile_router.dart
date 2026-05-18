import 'package:deehelp/ui/profile/profile_page.dart';
import 'package:go_router/go_router.dart';

class ProfileRouter {
  static const String path = '/';
  ProfileRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          builder: (_, __) => const ProfilePage(),
        ),
      ];
}
