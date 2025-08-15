import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:yousafe/app/router/router_config.dart';
import 'package:yousafe/shared/animation/fade_animator.dart';
import 'package:yousafe/shared/animation/scale_fade_animator.dart';
import 'package:yousafe/shared/animation/slide_fade_animator.dart';
import 'package:yousafe/features/splash/components/splash_background_animation.dart';
import 'package:yousafe/features/splash/components/splash_bottom_section.dart';
import 'package:yousafe/features/splash/components/splash_content.dart';
import 'package:yousafe/features/splash/components/splash_line_indicator.dart';
import 'package:yousafe/features/splash/components/splash_logo.dart';
import 'package:yousafe/shared/extensions/screen_size_extension.dart';

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
    await Future.delayed(const Duration(milliseconds: 3500));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.push(Routes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: SplashBackgroundAnimation(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleFadeAnimator(
                        duration: Duration(milliseconds: 1500),
                        child: SplashLogo(),
                      ),
                      SizedBox(height: 40),
                      SlideFadeAnimator(child: SplashContent()),
                      SizedBox(height: context.percentHeight(0.1)),
                      FadeAnimator(child: SplashLineIndicator()),
                    ],
                  ),
                ),
                FadeAnimator(child: SplashBottomSection()),
                SizedBox(height: context.percentHeight(0.05)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
