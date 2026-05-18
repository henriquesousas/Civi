import 'package:deehelp/old_core/router/slide_transition_page.dart';
import 'package:deehelp/v2/feature/location_disable/presentation/location_disable_page.dart';

import 'package:go_router/go_router.dart';

class LocationDisableRouter {
  static const String path = '/location-disable';
  LocationDisableRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const LocationDisablePage(),
          ),
        ),
      ];
}
