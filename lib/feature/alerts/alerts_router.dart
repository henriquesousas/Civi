import 'package:deehelp/feature/alerts/rouberry_attempt_type_page.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/feature/alerts/suspicious_activity_page.dart';
import 'package:go_router/go_router.dart';

class AlertsRouter {
  static const String chooseAttemptType = '/choose-attempt-type';
  static const String suspiciousActivity = '/suspicious-activity';
  AlertsRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: chooseAttemptType,
          pageBuilder: (context, state) {
            return slideDownToUpPage(
              key: state.pageKey,
              child: const RobberyAttemptTypePage(),
            );
          },
        ),
        GoRoute(
          path: suspiciousActivity,
          pageBuilder: (context, state) {
            return slideDownToUpPage(
              key: state.pageKey,
              child: const SuspiciousActivityPage(),
            );
          },
        ),
      ];
}
