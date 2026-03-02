import 'package:deehelp/feature/search/search_args.dart';
import 'package:deehelp/feature/search/search_page.dart';
import 'package:deehelp/old_core/ui/router/slide_transition_page.dart';
import 'package:go_router/go_router.dart';

class SearchRouter {
  static const String search = '/search';
  SearchRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: search,
          pageBuilder: (context, state) {
            final args = state.extra as SearchArgs?;
            return slideTransitionPage(
              key: state.pageKey,
              child: SearchPage(
                args: args,
              ),
            );
          },
        ),
      ];
}
