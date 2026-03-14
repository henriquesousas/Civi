import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/badge/badge_text.dart';
import 'package:deehelp/core/ui/widgets/buttons/button_outline.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/core/ui/widgets/textfield/text_field_primary.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImeiCard extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onScan;
  final VoidCallback onPaste;
  final VoidCallback onClear;
  final Function(String)? onChanged;
  final String? error;

  const ImeiCard({
    super.key,
    required this.onScan,
    required this.onPaste,
    required this.onClear,
    this.onChanged,
    this.error,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return PageCard(
      child: Padding(
        padding: const EdgeInsets.all(LayoutSpacingSize.container),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                HighlightIcon(
                  icon: Icon(
                    Icons.phone,
                    color: context.primaryColor,
                    size: IconSizes.md,
                  ),
                ),
                const SizedBox(width: SpacingSize.md),
                Expanded(
                  child: Text(
                    'Identificação do aparelho',
                    style: context.appText.bodymd.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const BadgeText(text: "Opcional"),
              ],
            ),
            const SizedBox(height: SpacingSize.md),
            TextFieldPrimary(
              controller: controller,
              hint: 'Digite ou leia automaticamente',
              labelText: 'IMEI (15 dígitos)',
              textInputType: TextInputType.number,
              onChanged: onChanged,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(15),
              ],
              error: error,
              // suffixIcon: controller.text.isEmpty
              //     ? null
              //     : IconButton(
              //         onPressed: onClear,
              //         icon: const Icon(Icons.close),
              //         color: const Color(0xFF8A96C8),
              //       ),
            ),
            const SizedBox(height: SpacingSize.md),
            Row(
              children: [
                Expanded(
                  child: ButtonOutline(
                    press: onScan,
                    height: ButtonSize.xm,
                    icon: const Icon(Icons.qr_code_scanner_outlined),
                    text: "Abrir teclado",
                  ),
                ),
                const SizedBox(width: SpacingSize.md),
                Expanded(
                  child: ButtonOutline(
                    press: onPaste,
                    height: ButtonSize.xm,
                    icon: const Icon(Icons.qr_code_scanner_outlined),
                    text: "Colar",
                  ),
                ),
              ],
            ),
            const SizedBox(height: SpacingSize.xl),
            Text(
              "Para você pode encontrar o IMEI digite *#06# na tela de discagem do aparelho ou na caixa do aparelho.",
              textAlign: TextAlign.start,
              style: context.appText.caption.copyWith(
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
                color: Colors.grey,
              ),
            ),
            // const SizedBox(height: SpacingSize.md),
            // CardHint(
            //   icon: Icon(Icons.info_outline,
            //       color: context.primaryColor, size: IconSizes.sm),
            //   title: "Onde encontrar o IMEI",
            //   message:
            //       "Você pode encontrar o IMEI em *#06# ou na caixa do aparelho.",
            // )
          ],
        ),
      ),
    );
  }
}
