import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/app_text_style.dart';
import 'package:deehelp/feature/items/success/bullet.dart';
import 'package:flutter/material.dart';

class CardNextStep extends StatelessWidget {
  const CardNextStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(LayoutSpacingSize.card),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Próximos passos?',
            style: context.appTextOld.headersm.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: SpacingSize.md),
          const Bullet(text: 'Seu item entra em análise e validação.'),
          const Bullet(
              text: 'Você pode adicionar fotos para ajudar na confirmação.'),
          const Bullet(text: 'Após aprovado, o status muda para Ativo.'),
        ],
      ),
    );
  }
}
