import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/v2/feature/profile/nickname/presentation/add_nickname_page.dart';
import 'package:go_router/go_router.dart';

class ProfileRouter {
  static const String path = '/nickname';
  ProfileRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: path,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const AddNicknamePage(),
          ),
        ),
      ];
}
