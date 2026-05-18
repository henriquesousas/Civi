import 'package:deehelp/feature/sos/sos_page.dart';
import 'package:deehelp/old_core/router/slide_transition_page.dart';
import 'package:go_router/go_router.dart';

class SOSRouter {
  static const String path = '/sos';
  SOSRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const SOSPage(),
          ),
        ),
      ];
}
