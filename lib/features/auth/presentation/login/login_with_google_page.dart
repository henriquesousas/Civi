import 'package:deehelp/app/router/router_config.dart';
import 'package:deehelp/core/resources/resources.dart';
import 'package:deehelp/core/ui/dialog/dialog_extension.dart';
import 'package:deehelp/features/auth/presentation/login/bloc/auth_state.dart';
import 'package:deehelp/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:deehelp/features/splash/components/splash_background_animation.dart';
import 'package:deehelp/shared/components/buttons/secondary_outline_button.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'bloc/auth_event.dart';
import 'components/login_google_button.dart';

class LoginWithGooglePage extends StatelessWidget {
  const LoginWithGooglePage({super.key});

  void submitLoginWithGoogle(BuildContext context, AuthState state) {
    context.read<LoginBloc>().add(
          LoginWithGoogleEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: SplashBackgroundAnimation(
          child: BlocConsumer<LoginBloc, AuthState>(
            listener: (context, state) {
              if (state.status == AuthStatus.error) {
                context.showDialogWarning(
                  R.strings.warning,
                  state.errorMessage ?? '',
                );
              }

              if (state.status == AuthStatus.success) {
                context.pushReplacement(Routes.bottomView);
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  Center(
                      child: Lottie.asset(
                    "assets/lottie/security_icon.json",
                    width: context.percentWidth(0.7),
                    height: context.percentHeight(0.7),
                  )),
                  Positioned(
                    bottom: 60,
                    left: 30,
                    right: 30,
                    child: Column(
                      children: [
                        Text(
                          R.strings.enterCreateAccount,
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
                        LoginGoogleButton(
                            onPressed: () =>
                                submitLoginWithGoogle(context, state)),
                        const SizedBox(height: 10),
                        SecondaryOutlineButton(
                          text: R.strings.continueWithoutLogin,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
