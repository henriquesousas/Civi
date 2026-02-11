import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'about_card.dart';
import 'pill.dart';
import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AboutCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // badge row
            Row(
              children: [
                Pill(
                  label: 'NOVO',
                  bg: context.primaryColor.withValues(alpha: 0.12),
                  fg: context.primaryColor,
                ),
                const SizedBox(width: SpacingSize.sm),
                Pill(
                  label: 'BETA',
                  bg: AppColors.orange.withValues(alpha: 0.12),
                  fg: AppColors.orange,
                ),
                const Spacer(),
                Icon(
                  Icons.info_outline,
                  color: context.secondaryColor,
                  size: IconSizes.md,
                ),
              ],
            ),
            const SizedBox(height: SpacingSize.md),
            Text(
              'Bem-vindo ao Tizzo 👋',
              style: context.appText.headerlg,
            ),
            const SizedBox(height: SpacingSize.sm),
            Text(
              'Estamos em desenvolvimento e sua participação faz diferença. '
              'Aqui você registra itens, acompanha ocorrências e ajuda sua comunidade a ficar mais segura.',
              style: context.appText.bodySmall.copyWith(
                color: context.secondaryColor,
                fontWeight: FontWeight.w500,
                height: 1.35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
