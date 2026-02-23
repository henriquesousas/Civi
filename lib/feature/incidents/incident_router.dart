import 'package:deehelp/feature/incidents/list/incident_list_page.dart';
import 'package:deehelp/feature/incidents/update/update_incident_args.dart';
import 'package:deehelp/feature/incidents/update/update_incident_page.dart';
import 'package:deehelp/feature/incidents/update/update_incident_page_tile.dart';
import 'package:deehelp/old_core/ui/router/slide_transition_page.dart';
import 'package:go_router/go_router.dart';

class IncidentRouter {
  static const String list = '/list-incident';
  static const String register = '/register-incident';
  static const String detail = '/detail-incident';
  static const String update = '/update-incident';
  static const String success = '/success-incident';
  IncidentRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: list,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const IncidentListPage(),
          ),
        ),
        GoRoute(
          path: detail,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const UpdateIncidentPage(),
          ),
        ),
        GoRoute(
          path: update,
          pageBuilder: (context, state) {
            final data = state.extra as Map<String, dynamic>;
            final args = UpdateIncidentArgs.from(data);

            return slideTransitionPage(
              key: state.pageKey,
              child: UpdateIncidentPageTile(args: args),
            );
          },
        ),
        // GoRoute(
        //   path: update,
        //   pageBuilder: (context, state) {
        //     final extra = state.extra as Map<String, dynamic>;
        //     final incident = extra['args'] as IncidentOutput;
        //     return slideTransitionPage(
        //       key: state.pageKey,
        //       child: IncidentDetailPage(incident: incident),
        //     );
        //   },
        // ),
      ];
}
