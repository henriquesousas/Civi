import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/services/session/user_session_service.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/theme/dimens.dart';
import 'package:deehelp/features/splash/components/splash_bg.dart';
import 'package:deehelp/features/splash/components/splash_content.dart';
import 'package:deehelp/features/splash/components/splash_progress.dart';
import 'package:deehelp/features/splash/components/splash_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/animation/transition_animator.dart';
import '../../core/router/router_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 5000));
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final session = await context.read<UserSessionService>().load();

      if (!mounted) return;

      if (session != null) {
        context.pushReplacement(RouterConstant.home);
      } else {
        context.pushReplacement(RouterConstant.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
