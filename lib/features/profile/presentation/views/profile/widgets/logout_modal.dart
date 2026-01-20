import 'package:deehelp/core/ui/router/app_router.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/features/auth/external/di/auth_view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogoutModal extends ConsumerWidget {
  const LogoutModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sair da conta",
                style: context.appTextStyles.sectionTitle,
              ),
              const SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                "Tem certeza que deseja sair da sua conta? Você precisará fazer login novamente para acessar o aplicativo.",
                style: context.appTextStyles.bodyTextStyle1.copyWith(
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
                      text: "Sim, quero sair",
                      press: () {
                        ref.watch(authViewViewModelProvider.notifier).signOut();
                        context.pushReplacement(AppRouter.splash);
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
