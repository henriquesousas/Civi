import 'package:deehelp/core/ui/router/app_router.dart';
import 'package:deehelp/core/ui/router/slide_transition_page.dart';
import 'package:deehelp/features/incident/presentation/report/report_incident_page.dart';
import 'package:deehelp/features/incident/presentation/list/incident_list_page.dart';
import 'package:deehelp/features/incident/presentation/report/report_incident_successfully_page.dart';
import 'package:deehelp/features/incident/presentation/update/update_incident_args.dart';
import 'package:deehelp/features/incident/presentation/update/update_incident_page.dart';
import 'package:deehelp/features/incident/presentation/update/update_incident_page_tile.dart';
import 'package:go_router/go_router.dart';

class IncidentModule {
  IncidentModule._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: AppRouter.reportIncident,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const ReportIncidentPage(),
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
        GoRoute(
          path: AppRouter.reportIncidentSuccess,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const ReportIncidentSuccessfullyPage(),
          ),
        ),
      ];
}
