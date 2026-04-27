import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class SectionSummary extends StatelessWidget {
  const SectionSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.themeColor.primaryBgColor,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: SizeLayoutSpacing.m,
        vertical: SizeLayoutSpacing.m,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resumo',
            style: context.appText.title.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: SizeSpacing.xl),
          Text(
            'A police standoff occurred on a freeway in Azusa, California, involving a suspect in a white truck who displayed a firearm during the pursuit. The standoff remained active for hours and caused significant traffic disruption on I-210 while officers secured the area.',
            style: context.appText.bodyLarger.copyWith(
              color: context.themeColor.secundaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
