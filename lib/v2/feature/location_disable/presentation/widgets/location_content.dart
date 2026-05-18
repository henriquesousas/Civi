import 'package:deehelp/old_core/extension/size_extension.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/buttons/ui_button_tertiary.dart';
import 'package:flutter/material.dart';

class LocationContent extends StatelessWidget {
  const LocationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          Text(
            'Localização desconhecida',
            textAlign: TextAlign.center,
            style: context.appText.header,
          ),
          const SizedBox(height: SizeSpacing.xl),
          Text(
            'Para exibir alertas próximos a você, habilite a permissão de localização e ative o GPS.',
            textAlign: TextAlign.center,
            style: context.appText.bodyLarger.copyWith(
              color: context.themeColor.secundaryTextColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: SizeSpacing.xxxl),
          UIButtonTertiary(
            width: context.percentWidth(0.5),
            text: 'PERMITIR',
            press: () {},
          ),
        ],
      ),
    );
  }
}
