import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class VerificationInfoCard extends StatelessWidget {
  const VerificationInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(LayoutSpacingSize.card),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RadiusSize.xxl),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HighlightIcon(
            icon: Icon(
              Icons.verified_user_outlined,
              color: context.primaryColor,
              size: IconSizes.sm,
            ),
          ),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verificação',
                  style: context.appText.headermd.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: SpacingSize.sm),
                Text(
                  'Todos os itens cadastrados passam por uma verificação da nossa equipe antes de ficarem visíveis no app.',
                  style: context.appText.caption.copyWith(
                    height: 1.35,
                    fontWeight: FontWeight.w600,
                    color: context.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
