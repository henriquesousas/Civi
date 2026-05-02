import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class TopDescription extends StatelessWidget {
  const TopDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeLayoutSpacing.m,
      ),
      child: Container(
        padding: const EdgeInsets.all(SizeLayoutSpacing.m),
        decoration: BoxDecoration(
          color: context.themeColor.primaryBgColor,
          borderRadius: BorderRadius.circular(SizeRadius.xxs),
          border: Border.all(
            color: Colors.white.withValues(alpha: .05),
          ),
        ),
        child: Text(
          'Cadastre veículos e celulares para acompanhar ocorrências e receber alertas rapidamente.',
          style: context.appText.caption.copyWith(
            fontWeight: FontWeight.w500,
            color: context.themeColor.secundaryTextColor,
          ),
        ),
      ),
    );
  }
}
