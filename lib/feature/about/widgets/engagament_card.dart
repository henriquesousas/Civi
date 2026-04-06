import 'package:deehelp/app_name.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'info_card.dart';
import 'package:flutter/material.dart';

class EngagementCard extends StatelessWidget {
  final VoidCallback onShare;
  const EngagementCard({super.key, required this.onShare});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      title: 'Precisamos da sua ajuda',
      icon: Icons.favorite_border_rounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: SpacingSize.sm),
          Text(
            'O ${AppName.appName} melhora com o uso da comunidade.',
            style: context.appText.bodySmall.copyWith(
              height: 1.35,
              // color: context.onSurface,
              color: context.onSurface,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: SpacingSize.sm),
          Text(
            '• Registre ocorrências com responsabilidade\n'
            '• Compartilhe o app com vizinhos e familiares\n'
            '• Envie sugestões — cada feedback conta',
            style: context.appText.bodySmall.copyWith(
              height: 1.35,
              color: context.secondaryTextColor,
            ),
          ),
          const SizedBox(height: SpacingSize.xl),
          ButtonOutline(
            bgColor: AppColors.primaryColor,
            borderColor: AppColors.primaryColor,
            textColor: Colors.white,
            icon: const Icon(Icons.share_outlined, color: Colors.white),
            text: 'Compartilhar o ${AppName.appName}',
            press: onShare,
          )
        ],
      ),
    );
  }
}
