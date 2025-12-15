import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/features/faq/faq_provider.dart';
import 'package:deehelp/features/map/presentation/map_page.dart';
import 'package:deehelp/features/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

import 'auth_router.dart';
import 'item_router.dart';
import '../../features/onboarding/page/onboard_router.dart';

class MainRouter {
  static var router = GoRouter(
    initialLocation: RouterConstant.splash,
    debugLogDiagnostics: true,
    // redirect: _redirect,
    // refreshListenable: authRepository,
    routes: [
      ...authRoutes,
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
        path: RouterConstant.faq,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: FaqProvider.page,
        ),
      ),
    ],
  );
}
