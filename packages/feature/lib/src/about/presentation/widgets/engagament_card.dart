import 'package:app_core/app_core.dart';
import 'package:app_feature/src/about/presentation/widgets/info_card.dart';
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
            'O Kotto melhora com o uso da comunidade.',
            style: context.appText.bodySmall.copyWith(
              height: 1.35,
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
            ),
          ),
          const SizedBox(height: SpacingSize.md),
          ButtonOutline(
            icon: const Icon(Icons.share_outlined),
            text: 'Compartilhar o Kotto',
            press: () {},
          )
        ],
      ),
    );
  }
}
