import 'package:deehelp/core/animation/slide_fade_transition_animator.dart';
import 'package:deehelp/core/animation/transform_scale_opacity_animator.dart';
import 'package:deehelp/core/animation/transition_animator.dart';
import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/features/splash/components/splash_background_animation.dart';
import 'package:deehelp/features/splash/components/splash_bottom_section.dart';
import 'package:deehelp/features/splash/components/splash_content.dart';
import 'package:deehelp/features/splash/components/splash_line_indicator.dart';
import 'package:deehelp/features/splash/components/splash_logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

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

    //TODO: Refactor pra nao deixar aqui essa implementacao com o firebase, ja tem um service pra isso
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // context.pushReplacement(RouterConstant.bottomView);
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
        child: SplashBackgroundAnimation(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TransformScaleOpacityAnimator(
                        duration: Duration(milliseconds: 1500),
                        child: SplashLogo(),
                      ),
                      const SizedBox(height: 40),
                      const SlideFadeTransitionAnimator(child: SplashContent()),
                      SizedBox(height: context.percentHeight(0.1)),
                      const SplashLineIndicator(),
                    ],
                  ),
                ),
                const TransitionAnimator(child: SplashBottomSection()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
