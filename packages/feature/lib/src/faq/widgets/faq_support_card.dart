import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class FaqSupportCard extends StatelessWidget {
  final VoidCallback onContact;
  final VoidCallback onSuggest;

  const FaqSupportCard({
    super.key,
    required this.onContact,
    required this.onSuggest,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        border: Border.all(color: context.outlineVariantColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.support_agent, color: context.primaryColor()),
              const SizedBox(width: SpacingSize.md),
              Text(
                'Ainda com dúvidas?',
                style: context.appText.body.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: SpacingSize.sm),
          Text(
            'Envie uma mensagem para o suporte ou compartilhe uma sugestão para melhorar o app.',
            style: context.appText.bodySmall.copyWith(
              height: 1.35,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: SpacingSize.md),
          Row(
            children: [
              Expanded(
                child: ButtonOutline(
                  press: () {},
                  text: "Sugestão",
                  icon: Icon(Icons.lightbulb_outline, size: IconSizes.md),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ButtonOutline(
                  press: () {},
                  text: "Suporte",
                  bgColor: context.primaryColor(),
                  textColor: Colors.white,
                  icon: Icon(
                    Icons.chat_outlined,
                    size: IconSizes.md,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
