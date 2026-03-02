import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class IncidentLoading extends StatelessWidget {
  const IncidentLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: LayoutSpacingSize.section),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: context.outlineVariantColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: ProgressIndicatorSizes.md,
            height: ProgressIndicatorSizes.md,
            child: const CircularProgressIndicator(),
          ),
          const SizedBox(height: SpacingSize.md),
          Text(
            'Buscando ocorrência...',
            textAlign: TextAlign.center,
            style: context.appText.headermd,
          ),
          const SizedBox(height: SpacingSize.sm),
          Text(
            'Estou verificando as ocorrências por aqui 🦉\n'
            'Aguarde um instante...',
            textAlign: TextAlign.center,
            style: context.appText.caption.copyWith(
              fontWeight: FontWeight.w600,
              height: 1.35,
              color: context.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
