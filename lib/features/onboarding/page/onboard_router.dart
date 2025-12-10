import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/features/onboarding/page/onboard_cubit.dart';
import 'package:deehelp/features/onboarding/page/onboard_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final onboardingRoutes = [
  GoRoute(
    path: RouterConstant.onboarding,
    pageBuilder: (context, state) => slideTransitionPage(
      key: state.pageKey,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<OnboardCubit>(
            create: (context) => OnboardCubit(
              loginWithGoogleUsecase: context.read(),
              session: context.read(),
            ),
          ),
        ],
        child: const OnboardPage(),
      ),
    ),
  ),
];
