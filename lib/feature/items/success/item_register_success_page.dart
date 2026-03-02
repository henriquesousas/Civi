import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/bubble/bubble_export.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
import 'package:deehelp/feature/items/success/card_next_step.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ItemRegisterSuccessPage extends StatelessWidget {
  final String? itemName;
  final String? itemId;
  final VoidCallback? onAddPhotos;
  final VoidCallback? onClose;

  const ItemRegisterSuccessPage({
    super.key,
    this.itemName,
    this.itemId,
    this.onAddPhotos,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: DecorativeBubblesBackground(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => context.pop(),
                        child: HighlightIcon(
                          containerSize: IconSizes.xxl,
                          radius: RadiusSize.md,
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.18)),
                          bgColor: AppColors.primaryColorVariant
                              .withValues(alpha: 0.7),
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          // const OwlSadSpeechBubble(
                          //   file: 'assets/lottie/owl_happy.json',
                          //   message:
                          //       "Perfeito! 🦉✨\nSeu item foi cadastrado com sucesso.\nAgora ele está protegido e monitorado.",
                          // ),
                          Lottie.asset(
                            "assets/lottie/loader_success.json",
                            width: 200,
                            height: 200,
                            repeat: false,
                          ),
                          Text(
                            'Cadastro recebido!',
                            textAlign: TextAlign.center,
                            style: context.appText.headerxl.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: SpacingSize.md),
                          Text(
                            'Recebemos seu cadastro e ele passará por validações da nossa equipe antes de ficar visível no app.',
                            textAlign: TextAlign.center,
                            style: context.appText.bodySmall.copyWith(
                              height: 1.35,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: SpacingSize.xxl),
                          const CardNextStep(),
                          const SizedBox(height: SpacingSize.md),
                          const Spacer(),
                          ButtonOutline(
                            bgColor: Colors.white,
                            icon: const Icon(Icons.share_outlined),
                            press: () {
                              UrlLauncherUtils.shareApp(context);
                            },
                            text: 'Compartilhar o app',
                          ),
                          const SizedBox(height: SpacingSize.md),
                          ButtonInline(
                            text: "Fechar",
                            press: () => Navigator.pop(context),
                            // onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
