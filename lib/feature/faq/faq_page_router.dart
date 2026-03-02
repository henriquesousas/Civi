import 'package:deehelp/feature/faq/faq_page.dart';
import 'package:deehelp/old_core/ui/router/slide_transition_page.dart';
import 'package:go_router/go_router.dart';

class FaqPageRouter {
  static const String path = '/faq';
  FaqPageRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const FaqPage(),
          ),
        ),
      ];
}
