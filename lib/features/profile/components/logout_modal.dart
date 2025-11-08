import 'package:deehelp/core/components/buttons/ui_secondary_button.dart';
import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/resources/resources.dart';
import '../../../core/theme/app_colors.dart';

class LogoutModal extends StatelessWidget {
  const LogoutModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: context.percentWidth(0.95),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
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
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UISecondaryButton(
                  textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.errorColor,
                      ),
                  text: R.strings.logoutConfirmButton,
                  width: context.percentWidth(0.5),
                  press: () {
                    final instance = FirebaseAuth.instance;
                    if (instance.currentUser != null) {
                      instance.signOut();
                    }
                    context.pushReplacement(RouterConstant.splash);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
