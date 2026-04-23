import 'package:deehelp/v2/core/extensions/text_extension.dart';
import 'package:deehelp/v2/core/extensions/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "O que aconteceu?",
          textAlign: TextAlign.center,
          style: context.appText.header.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Travessa Francisco Alves da Silva, 2, Osasco, São Paulo',
          textAlign: TextAlign.center,
          style: context.appText.subtitle.copyWith(
            color: context.themeColor.secundaryTextColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
