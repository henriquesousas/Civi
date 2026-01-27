import 'package:deehelp/app_bootstrap_provider.dart';
import 'package:deehelp/core/ui/animation/transition_animator.dart';
import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/router/app_router.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/features/splash/components/splash_bg.dart';
import 'package:deehelp/features/splash/components/splash_content.dart';
import 'package:deehelp/features/splash/components/splash_progress.dart';
import 'package:deehelp/features/splash/components/splash_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _dispatcher();
  }

  void _dispatcher() async {
    // await Future.delayed(const Duration(milliseconds: 3000));
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   context.pushReplacement(AppRouter.onboarding);
    // });
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
