import 'package:deehelp/old_core/router/slide_transition_page.dart';
import 'package:deehelp/v2/feature/notification/presentation/notification_page.dart';
import 'package:go_router/go_router.dart';

class NotificationRouter {
  static const String path = '/notification';
  NotificationRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const NotificationPage(),
          ),
        ),
      ];
}
