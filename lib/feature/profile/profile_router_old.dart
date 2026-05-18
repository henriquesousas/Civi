import 'package:deehelp/old_core/router/slide_transition_page.dart';

import 'profile_page.dart';
import 'package:go_router/go_router.dart';

class ProfileRouterOld {
  static const String path = '/profile';
  ProfileRouterOld._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const ProfilePage(),
          ),
        ),
      ];
}
