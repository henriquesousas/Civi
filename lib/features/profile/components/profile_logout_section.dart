import 'package:deehelp/core/ui/dialog/dialog_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/router_config.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/resources/resources.dart';
import '../../../shared/components/buttons/secondary_outline_button.dart';
import '../../auth/data/firebase/google_sign_in_service.dart';

class ProfileLogoutSection extends StatelessWidget {
  const ProfileLogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  R.strings.version,
                  style: context.textSmall
                      .copyWith(color: AppColors.textSecondary),
                ),
                Text(
                  "1.0.0",
                  style: context.textSmall.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SecondaryOutlineButton(
            onPressed: () {
              //TODO: Nao usar GoogleSignInService direto tem um usecase pra isso
              context.showDialogQuestion(
                title: "Deslogar",
                message: "Sair do aplicativo?",
                onConfirmButton: () {
                  GoogleSignInService().signOut();
                  context.pushReplacement(Routes.splash);
                },
              );
            },
            text: R.strings.exitApp,
            borderColor: AppColors.error,
            textStyle: context.textSmallMedium.copyWith(
              color: AppColors.error,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
