import 'package:deehelp/feature/incidents/incident_detail_comunity_page.dart';
import 'package:deehelp/feature/incidents/list/incident_list_page.dart';
import 'package:deehelp/feature/incidents/report/report_incident_page.dart';
import 'package:deehelp/feature/incidents/report/report_incident_successfully_page.dart';
import 'package:deehelp/feature/incidents/report/widgets/success/regiter_incident_success_args.dart';
import 'package:deehelp/feature/incidents/update/update_incident_args.dart';
import 'package:deehelp/feature/incidents/update/update_incident_page.dart';
import 'package:deehelp/feature/incidents/update/update_incident_page_tile.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:go_router/go_router.dart';

class IncidentRouter {
  static const String list = '/list-incident';
  static const String register = '/register-incident';
  static const String detail = '/detail-incident';
  static const String detailComunity = '/detail-incident-comunity';
  static const String update = '/update-incident';
  static const String success = '/success-incident';
  IncidentRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: register,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const ReportIncidentPage(),
          ),
        ),
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
          path: detailComunity,
          pageBuilder: (context, state) {
            final data = state.extra as IncidentOutput;
            return slideTransitionPage(
              key: state.pageKey,
              child: IncidentDetailComunityPage(
                incident: data,
              ),
            );
          },
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
        GoRoute(
          path: success,
          pageBuilder: (context, state) {
            final args = state.extra as RegiterIncidentSuccessArgs;
            return slideTransitionPage(
              key: state.pageKey,
              child: ReportIncidentSuccessfullyPage(
                args: args,
              ),
            );
          },
        ),
      ];
}
