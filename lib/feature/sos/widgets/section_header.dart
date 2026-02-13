import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Serviços essenciais',
          style: context.appText.headermd,
        ),
        const SizedBox(height: 3),
        Text('Liga direto para o atendimento',
            style: context.appText.bodySmall),
      ],
    );
  }
}
