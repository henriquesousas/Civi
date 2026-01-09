import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/extensions/string_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/features/auth/external/di/auth_view_model_provider.dart';
import 'package:deehelp/features/auth/presentation/auth/state/auth_state.dart';
import 'package:deehelp/features/splash/components/splash_bg.dart';
import 'package:deehelp/features/splash/components/splash_content.dart';
import 'package:deehelp/features/splash/components/splash_progress.dart';
import 'package:deehelp/features/splash/components/splash_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/ui/animation/transition_animator.dart';
import '../../core/router/app_router.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkUserAuthentication();
  }

  void _checkUserAuthentication() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.pushReplacement(AppRouter.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authViewViewModelProvider, (previous, currentState) {
      switch (currentState) {
        case AuthStateAuthenticated(:final user):
          if (user.authMethod == AuthMethod.google &&
              user.nickName.isNullOrEmpty()) {
            context.pushReplacement(AppRouter.addNickname);
          } else {
            context.pushReplacement(AppRouter.dashboard);
          }
          return;
        case AuthStateUnAuthenticated():
          context.pushReplacement(AppRouter.onboarding);
          break;
      }
    });

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: SplashBg(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SplashLogo(),
                      SizedBox(height: Dimens.size40.h),
                      const SplashContent(),
                      SizedBox(height: context.percentHeight(0.1)),
                      const SplashProgress(),
                    ],
                  ),
                ),
                TransitionAnimator(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Versão 1.0",
                      style: context.appTextStyles.caption1Style
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
