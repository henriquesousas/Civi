import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:go_router/go_router.dart';

import '../../features/onboarding/onboarding_page.dart';

final onboardingRoutes = [
  GoRoute(
    path: RouterConstant.onboarding,
    pageBuilder: (context, state) => slideTransitionPage(
      key: state.pageKey,
      child: const OnboardingPage(),
    ),
  ),
];
