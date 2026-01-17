import 'package:deehelp/core/router/app_router.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/features/incident/presentation/views/add/add_incident_page.dart';
import 'package:deehelp/features/incident/presentation/list/incident_list_page.dart';
import 'package:deehelp/features/incident/presentation/views/update/update_incident_args.dart';
import 'package:deehelp/features/incident/presentation/views/update/update_incident_page.dart';
import 'package:deehelp/features/incident/presentation/views/update/update_incident_page_tile.dart';
import 'package:go_router/go_router.dart';

class IncidentModule {
  IncidentModule._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: AppRouter.addIncident,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const AddIncidentPage(),
          ),
        ),
        GoRoute(
          path: AppRouter.incidents,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const IncidentListPage(),
          ),
        ),
        GoRoute(
          path: AppRouter.updateIncident,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const UpdateIncidentPage(),
          ),
        ),
        GoRoute(
          path: AppRouter.updateIncidentTile,
          pageBuilder: (context, state) {
            final data = state.extra as Map<String, dynamic>;
            final args = UpdateIncidentArgs.from(data);

            return slideTransitionPage(
              key: state.pageKey,
              child: UpdateIncidentPageTile(args: args),
            );
          },
        ),
      ];
}
