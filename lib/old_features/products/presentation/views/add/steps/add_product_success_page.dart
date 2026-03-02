import 'package:deehelp/old_core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/old_features/splash/components/splash_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../old_core/ui/animation/slide_fade_transition_animator.dart';
import '../../../../../../old_core/ui/animation/transform_scale_opacity_animator.dart';

class AddProductSuccessPage extends StatefulWidget {
  const AddProductSuccessPage({super.key});

  @override
  State<AddProductSuccessPage> createState() => _AddProductSuccessPageState();
}

class _AddProductSuccessPageState extends State<AddProductSuccessPage> {
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
                        "Cadastro recebido",
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
                          "Obrigado pelo cadastro! Todos os produtos passam por verificação interna para sua segurança. Em breve estará disponível.",
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
                        text: "Fechar",
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
