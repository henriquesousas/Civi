import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/core/resources/resources.dart';
import 'package:deehelp/features/splash/components/splash_background_animation.dart';
import 'package:deehelp/shared/components/buttons/secondary_outline_button.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../onboarding/components/onboarding_logo.dart';
import 'components/login_google_button.dart';

class LoginWithGooglePage extends StatelessWidget {
  const LoginWithGooglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: SplashBackgroundAnimation(
          child: Stack(
            children: [
              OnboardingLogo(
                icon: Icon(
                  Icons.lock,
                  color: AppColors.primary,
                  size: context.responsiveRadius(0.1),
                ),
              ),
              Positioned(
                bottom: 60,
                left: 30,
                right: 30,
                child: Column(
                  children: [
                    Text(
                      "Entrar/Criar conta",
                      style: context.textRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      R.strings.loginInfo,
                      textAlign: TextAlign.center,
                      style: context.textSmallLight.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.white.withValues(alpha: 0.9),
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 20),
                    LoginGoogleButton(onPressed: () {}),
                    const SizedBox(height: 10),
                    SecondaryOutlineButton(
                      text: "Continuara sem logar",
                      textStyle: context.textSmallRegular,
                      foregroundColor: Colors.white,
                      borderColor: Colors.white,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
