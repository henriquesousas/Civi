import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class TopDescription extends StatelessWidget {
  const TopDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeLayoutSpacing.m,
        vertical: SizeLayoutSpacing.m,
      ),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.white.withValues(alpha: 0.10),
            width: 1,
          ),
        ),
      ),
      child: Text(
        'Cadastre ou gerencie, carros, motos e celulares para acompanhar ocorrências e receber alertas rapidamente.',
        style: context.appText.bodyLarger.copyWith(
          color: context.themeColor.secundaryTextColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
