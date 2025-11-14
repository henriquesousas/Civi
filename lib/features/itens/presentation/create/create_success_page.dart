import 'package:deehelp/core/components/buttons/ui_secondary_button.dart';
import 'package:deehelp/features/splash/components/splash_background_animation.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/resources.dart';
import '../../../../shared/animation/slide_fade_transition_animator.dart';
import '../../../../shared/animation/transform_scale_opacity_animator.dart';

class CreateSuccessPage extends StatefulWidget {
  const CreateSuccessPage({super.key});

  @override
  State<CreateSuccessPage> createState() => _CreateSuccessPageState();
}

class _CreateSuccessPageState extends State<CreateSuccessPage> {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TransformScaleOpacityAnimator(
                  duration: const Duration(milliseconds: 1500),
                  child: Lottie.asset(
                    "assets/lottie/loader_success.json",
                    width: 200,
                    height: 200,
                    repeat: false,
                  ),
                ),
                const SizedBox(height: 40),
                SlideFadeTransitionAnimator(
                  child: Column(
                    spacing: 20,
                    children: [
                      Text(
                        "Whoooo!",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                      ),
                      Text(
                        R.strings.itemRegisterReceiver,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          R.strings.itemRegisterSuccessMessage,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Colors.white.withValues(alpha: 0.7),
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ),
                      UISecondaryButton(
                        borderRadius: 90,
                        text: R.strings.goAhead,
                        width: context.percentWidth(0.8),
                        press: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                      )
                    ],
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
