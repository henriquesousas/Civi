import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/features/settings/help/help_card.dart';
import 'package:deehelp/features/settings/help/help_options.dart';
import 'package:deehelp/shared/animation/fade_slide_transition_animator.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors_v2.dart';

class HelpOldPage extends StatefulWidget {
  const HelpOldPage({super.key});

  @override
  State<HelpOldPage> createState() => _HelpOldPageState();
}

class _HelpOldPageState extends State<HelpOldPage> {
  List<HelpOptions> _supportOptions = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _supportOptions = [
      const HelpOptions(
        id: 'chat',
        title: 'WhatsApp',
        subtitle: 'Fale com nossa equipe de suporte',
        icon: Icons.chat_bubble_outline,
        color: AppColorsV2.success,
        isAvailable: true,
        estimatedWait: '2-3 min',
      ),
      const HelpOptions(
        id: 'call',
        title: 'Ligar',
        subtitle: 'Converse diretamente com um atendente',
        icon: Icons.phone_outlined,
        color: AppColorsV2.primary,
        isAvailable: true,
        estimatedWait: '5-7 min',
      ),
      const HelpOptions(
        id: 'email',
        title: 'Email',
        subtitle: 'Mande uma mensagem com mais detalhes',
        icon: Icons.email_outlined,
        color: AppColorsV2.secondary,
        isAvailable: true,
        estimatedWait: '2-4 hours',
      ),
      const HelpOptions(
        id: 'emergency',
        title: 'Policia',
        subtitle:
            'Atendimento de segurança 24 horas por dia, 7 dias por semana',
        icon: Icons.emergency,
        color: AppColorsV2.error,
        isAvailable: true,
        estimatedWait: 'Imediato',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsV2.background,
      appBar: const UIAppBar(title: "Ajuda"),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Todos os direitos reservado",
              style: context.textSmall.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Desenvolvido por Àtomos LTDA - 2025",
              style: context.textSmall.copyWith(
                color: AppColorsV2.textSecondary,
              ),
            )
          ],
        ),
      ),
      body: FadeSlideTransitionAnimator(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.support_agent,
                    color: AppColorsV2.primary,
                    size: 30,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Contatar Suporte ',
                    style: context.textMediumSmall.copyWith(
                      color: AppColorsV2.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 0.8,
                ),
                itemCount: _supportOptions.length,
                itemBuilder: (context, index) {
                  return HelpCard(helpOption: _supportOptions[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
