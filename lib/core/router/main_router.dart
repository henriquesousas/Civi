import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/features/home/home_view.dart';
import 'package:deehelp/features/occurrence/occurrence_detail_page.dart';
import 'package:deehelp/features/occurrence/occurrence_page.dart';
import 'package:deehelp/features/settings/faq/faq_provider.dart';
import 'package:deehelp/features/settings/help/help_page.dart';
import 'package:deehelp/features/splash/splash_page.dart';
import 'package:deehelp/features/welcome/old/welcome_provider.dart';
import 'package:go_router/go_router.dart';

import '../../entry_point.dart';
import 'auth_router.dart';
import 'item_router.dart';
import 'onboarding_router.dart';

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
        path: RouterConstant.occurrences,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: OccurrencePage(),
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
        path: RouterConstant.help,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const HelpPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.productDetail,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const OccurrenceDetailPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.onboarding2,
        builder: (context, state) => WelcomeProvider.page,
      ),
      GoRoute(
        path: RouterConstant.home,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: RouterConstant.bottomView,
        builder: (context, state) => const EntryPoint(), //MainPage(),
      ),
    ],
  );
}

// GoRoute(
//   path: RouterConstant.welcome,
//   pageBuilder: (context, state) => slideTransitionPage(
//     key: state.pageKey,
//     child: const WelcomePage(),
//   ),
// ),
// GoRoute(
//   path: RouterConstant.settings,
//   pageBuilder: (context, state) => slideTransitionPage(
//     key: state.pageKey,
//     child: const SettingsPage(),
//   ),
// ),

// GoRoute(
//   path: RouterConstant.terms,
//   pageBuilder: (context, state) => slideTransitionPage(
//     key: state.pageKey,
//     child: const UserTermsView(),
//   ),
// ),
// GoRoute(
//   path: RouterConstant.privacyPolicy,
//   pageBuilder: (context, state) => slideTransitionPage(
//     key: state.pageKey,
//     child: const PrivacyPolicyPage(),
//   ),
// ),
// GoRoute(
//   path: RouterConstant.favorites,
//   builder: (context, state) => FavouriteView(),
// ),
