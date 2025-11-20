import 'package:deehelp/core/components/buttons/ui_outline_button.dart';
import 'package:deehelp/core/components/buttons/ui_primary_button.dart';
import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/resources/resources.dart';

class LogoutModal extends StatelessWidget {
  const LogoutModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        child: Column(
          children: [
            Text(
              R.strings.logoutExitTitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              R.strings.logoutExitMessage,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: UIPrimaryButton(
                    // textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    //       color: AppColors.errorColor,
                    //     ),
                    text: R.strings.logoutConfirmButton,

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
                  child: UIOutlineButton(
                    // textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    //       color: AppColors.errorColor,
                    //     ),

                    borderColor: AppColors.errorColorDark,
                    textColor: AppColors.errorColorDark,
                    text: "Cancelar",
                    press: () {
                      context.pop();
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
