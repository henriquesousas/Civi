import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/features/onboarding/page/onboard_page.dart';
import 'package:go_router/go_router.dart';

final onboardingRoutes = [
  GoRoute(
      path: RouterConstant.onboarding,
      pageBuilder: (context, state) {
        return slideTransitionPage(
            key: state.pageKey, child: const OnboardPage());
      }),
];
