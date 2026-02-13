import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/bubble/bubble_export.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
import 'package:deehelp/feature/items/success/card_id.dart';
import 'package:deehelp/feature/items/success/card_next_step.dart';
import 'package:deehelp/old_core/ui/animation/transform_scale_opacity_animator.dart';
import 'package:deehelp/old_core/utils/url_launcher_utils.dart';
import 'package:flutter/material.dart';
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

  static const bgBlue = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlue,
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
                    TransformScaleOpacityAnimator(
                      duration: const Duration(milliseconds: 1500),
                      child: Lottie.asset(
                        "assets/lottie/loader_success.json",
                        width: 180,
                        height: 180,
                        repeat: false,
                      ),
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
                    Text(
                      'Recebemos seu cadastro e ele passará por validações da nossa equipe antes de ficar visível no app.',
                      textAlign: TextAlign.center,
                      style: context.appText.bodySmall.copyWith(
                        height: 1.35,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: RadiusSize.md),
                    const CardId(itemId: "123456"),
                    const CardNextStep(),
                    const Spacer(),
                    ButtonOutline(
                      bgColor: Colors.white,
                      icon: const Icon(Icons.share_outlined),
                      press: () {
                        UrlLauncherUtils.shareIncident(
                          context,
                          "123",
                          DateTime.now(),
                        );
                      },
                      text: 'Compartilhar o app',
                    ),
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
      ),
    );
  }
}
