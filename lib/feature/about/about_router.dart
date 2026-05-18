import 'package:deehelp/old_core/router/slide_transition_page.dart';

import 'about_page.dart';
import 'package:go_router/go_router.dart';

class AboutRouter {
  static const String path = '/about';
  AboutRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const AboutPage(),
          ),
        ),
      ];
}
