import 'package:deehelp/features/auth/domain/gender.dart';
import 'package:deehelp/features/auth/domain/user_builder.dart';
import 'package:deehelp/features/splash/components/splash_background_animation.dart';
import 'package:deehelp/features/splash/components/splash_bottom_section.dart';
import 'package:deehelp/features/splash/components/splash_content.dart';
import 'package:deehelp/features/splash/components/splash_line_indicator.dart';
import 'package:deehelp/features/splash/components/splash_logo.dart';
import 'package:deehelp/shared/animation/slide_fade_transition_animator.dart';
import 'package:deehelp/shared/animation/transform_scale_opacity_animator.dart';
import 'package:deehelp/shared/animation/transition_animator.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    // await Future.delayed(const Duration(milliseconds: 5000));
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.push(Routes.onboarding);
    // });

    final user = UserBuilder(
            name: "Paulo",
            surName: "any",
            email: "paulohenriqussssess2201sas4@gmail.com",
            phone: "11972732245",
            password: "prm260110",
            gender: Gender.male)
        .build();

    // final repo = FirebaseAuthRepository();
    // repo.save(user);
    // repo.login("paulohenriquess2201sas4@gmail.com", "prm260110");
    // final u = FirebaseAuth.instance.createUserWithEmailAndPassword(
    //   email: "paulo@gmail.com",
    //   password: "prm260110",
    // );

    // FirebaseAuth.instance.signOut();
    //
    // FirebaseAuth.instance.signInWithEmailAndPassword(
    //   email: "paulo@gmail.com",
    //   password: "prm260110",
    // );
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
                SizedBox(height: context.percentHeight(0.05)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
