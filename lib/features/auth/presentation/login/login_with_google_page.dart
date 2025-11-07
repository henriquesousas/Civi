import 'package:deehelp/core/components/buttons/ui_google_button.dart';
import 'package:deehelp/core/components/buttons/ui_outline_button.dart';
import 'package:deehelp/core/components/dialogs/dialog_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/auth/presentation/login/bloc/auth_state.dart';
import 'package:deehelp/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:deehelp/features/splash/components/splash_background_animation.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/router/router_constants.dart';
import 'bloc/auth_event.dart';

class LoginWithGooglePage extends StatelessWidget {
  const LoginWithGooglePage({super.key});

  void _submitLoginWithGoogle(BuildContext context, AuthState state) {
    context.read<LoginBloc>().add(
          LoginWithGoogleEvent(),
        );
  }

  void _submitContinueWithoutLogin(BuildContext context) {
    context.pushReplacement(RouterConstant.bottomView);
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
                context.pushReplacement(RouterConstant.bottomView);
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  Positioned(
                    bottom: 60,
                    left: 30,
                    right: 30,
                    child: Column(
                      children: [
                        Lottie.asset(
                          "assets/lottie/security_icon.json",
                          width: context.percentWidth(0.7),
                          height: context.percentHeight(0.7),
                        ),
                        Text(
                          R.strings.enterCreateAccount,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.6,
                              ),
                        ),
                        Text(
                          R.strings.loginInfo,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white.withValues(alpha: 0.7),
                                    height: 1.6,
                                  ),
                        ),
                        const SizedBox(height: 20),
                        UIGoogleButton(
                          press: () => _submitLoginWithGoogle(context, state),
                          bgColor: AppColors.whiteColor,
                        ),
                        const SizedBox(height: 10),
                        UIOutlineButton(
                          text: R.strings.continueWithoutLogin,
                          borderColor: Colors.white,
                          textColor: Colors.white,
                          press: () => _submitContinueWithoutLogin(context),
                        ),
                        // const SizedBox(height: 10),
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
