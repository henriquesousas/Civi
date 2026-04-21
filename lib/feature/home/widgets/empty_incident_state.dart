import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
import 'package:flutter/material.dart';

class EmptyIncidentsState extends StatelessWidget {
  const EmptyIncidentsState({super.key});

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
          HighlightIcon(
            containerSize: IconContainerSizes.xl,
            radius: RadiusSize.xl,
            icon: Icon(
              Icons.radar_rounded,
              size: IconSizes.xxl,
              color: context.primaryColor,
            ),
          ),
          // OwlSadSpeechBubble(
          //   width: ImageSize.xl,
          //   height: ImageSize.xl,
          //   message:
          //       'Tudo calmo por aqui!👌\nSe algo acontecer, eu te aviso, estou de olho 👀.',
          //   // file: 'assets/lottie/owl2.json',
          //   primary: false,
          // ),
          // Lottie.asset(
          //   'assets/lottie/owl_stopped.json',
          //   width: ImageSize.xl,
          //   height: ImageSize.xl,
          //   repeat: true,
          // ),
          const SizedBox(height: SpacingSize.md),
          Text(
            'Nenhuma ocorrência recente',
            textAlign: TextAlign.center,
            style: context.appTextOld.headermd,
          ),
          const SizedBox(height: SpacingSize.sm),
          Text(
            'Não encontramos registros na sua região no momento.\n'
            'Isso é um bom sinal 👌',
            textAlign: TextAlign.center,
            style: context.appTextOld.caption.copyWith(
              fontWeight: FontWeight.w600,
              height: 1.35,
              color: context.secondaryColor,
            ),
          ),
          const SizedBox(height: SpacingSize.sm),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: context.secondaryContainer,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: context.outlineVariantColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.campaign_outlined,
                  size: IconSizes.md,
                  color: context.secondaryColor,
                ),
                const SizedBox(width: SpacingSize.sm),
                Expanded(
                  child: Text(
                    'Se algo acontecer, registre para avisar a comunidade',
                    style: context.appTextOld.caption.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.secondaryColor,
                    ),
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
