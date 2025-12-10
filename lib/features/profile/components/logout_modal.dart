import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/widgets/buttons/ui_elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/ui/localization/resources.dart';

class LogoutModal extends StatelessWidget {
  const LogoutModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "R.strings.logoutExitTitle",
                style: context.appTextStyles.sectionTitle,
              ),
              const SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                "R.strings.logoutExitMessage",
                style: context.appTextStyles.sectionSubTitle1.copyWith(
                  color: AppColors.textColorBody,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: UIElevatedButton(
                      text: "R.strings.logoutConfirmButton",
                      press: () {
                        final instance = FirebaseAuth.instance;
                        if (instance.currentUser != null) {
                          instance.signOut();
                        }
                        context.pushReplacement(RouterConstant.splash);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: UIElevatedButton(
                      bgColor: AppColors.whiteColor,
                      borderColor: AppColors.errorColorDark,
                      textColor: AppColors.errorColorDark,
                      text: "Cancelar",
                      press: () {
                        context.pop();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
