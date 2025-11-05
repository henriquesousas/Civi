import 'package:deehelp/features/settings/help/help_card.dart';
import 'package:deehelp/features/settings/help/help_options.dart';
import 'package:deehelp/shared/animation/fade_slide_transition_animator.dart';
import 'package:deehelp/shared/components/primary_app_bar.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
        color: AppColors.success,
        isAvailable: true,
        estimatedWait: '2-3 min',
      ),
      const HelpOptions(
        id: 'call',
        title: 'Ligar',
        subtitle: 'Converse diretamente com um atendente',
        icon: Icons.phone_outlined,
        color: AppColors.primary,
        isAvailable: true,
        estimatedWait: '5-7 min',
      ),
      const HelpOptions(
        id: 'email',
        title: 'Email',
        subtitle: 'Mande uma mensagem com mais detalhes',
        icon: Icons.email_outlined,
        color: AppColors.secondary,
        isAvailable: true,
        estimatedWait: '2-4 hours',
      ),
      const HelpOptions(
        id: 'emergency',
        title: 'Policia',
        subtitle:
            'Atendimento de segurança 24 horas por dia, 7 dias por semana',
        icon: Icons.emergency,
        color: AppColors.error,
        isAvailable: true,
        estimatedWait: 'Imediato',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const PrimaryAppBar(title: "Ajuda"),
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
                color: AppColors.textSecondary,
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
                    color: AppColors.primary,
                    size: 30,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Contatar Suporte ',
                    style: context.textMediumSmall.copyWith(
                      color: AppColors.textPrimary,
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
