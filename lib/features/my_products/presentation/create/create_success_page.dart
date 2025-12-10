import 'package:deehelp/core/components/buttons/ui_secondary_button.dart';
import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/widgets/buttons/ui_elevated_button.dart';
import 'package:deehelp/features/splash/components/splash_background_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/animation/slide_fade_transition_animator.dart';
import '../../../../core/animation/transform_scale_opacity_animator.dart';
import '../../../../core/ui/assets/resources.dart';

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
                    spacing: 10,
                    children: [
                      Text(
                        "Parabéns!",
                        style: context.appTextStyles.bodyTextStyle1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          fontSize: context.responsiveText(0.05),
                        ),
                      ),
                      Text(
                        "R.strings.itemRegisterReceiver",
                        textAlign: TextAlign.center,
                        style:
                            context.appTextStyles.sectionBodyTextStyle.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "itemRegisterSuccessMessage",
                          textAlign: TextAlign.center,
                          style: context.appTextStyles.caption1Style.copyWith(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w300,
                            fontSize: context.responsiveText(0.03),
                          ),
                        ),
                      ),
                      UIElevatedButton(
                        width: context.percentWidth(0.8),
                        bgColor: AppColors.whiteColor,
                        textColor: AppColors.primaryColor,
                        text: "R.strings.goAhead",
                        press: () => Navigator.popUntil(
                            context, (route) => route.isFirst),
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
