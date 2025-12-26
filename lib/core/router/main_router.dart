import 'package:deehelp/core/router/item_router.dart';
import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/features/auth/presentation/nickname/add_nickname_page.dart';
import 'package:deehelp/features/dashboard/presentation/dashsboard_page.dart';
import 'package:deehelp/features/faq/faq_provider.dart';
import 'package:deehelp/features/incident/presentation/add/add_incident_page.dart';
import 'package:deehelp/features/map/presentation/map_page.dart';
import 'package:deehelp/features/onboarding/page/onboard_router.dart';
import 'package:deehelp/features/profile/presentation/profile_page.dart';
import 'package:deehelp/features/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

class MainRouter {
  static var router = GoRouter(
    initialLocation: RouterConstant.splash,
    debugLogDiagnostics: true,
    // redirect: _redirect,
    // refreshListenable: authRepository,
    routes: [
      ...itemRoutes,
      ...onboardingRoutes,
      GoRoute(
        path: RouterConstant.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RouterConstant.map,
        builder: (context, state) => const MapPage(),
      ),
      GoRoute(
        path: RouterConstant.dashboard,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const DashsboardPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.profile,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const ProfilePage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.faq,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: FaqProvider.page,
        ),
      ),
      GoRoute(
        path: RouterConstant.addIncident,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const AddIncidentPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.addNickname,
        pageBuilder: (context, state) {
          return slideTransitionPage(
            key: state.pageKey,
            child: AddNicknamePage(),
          );
        },
      ),
    ],
  );
}
