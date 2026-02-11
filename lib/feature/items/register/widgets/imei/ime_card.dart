import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/badge/badge_text.dart';
import 'package:deehelp/core/ui/widgets/buttons/button_outline.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/core/ui/widgets/textfield/text_field_primary.dart';
import 'package:deehelp/feature/items/register/widgets/card_page.dart';
import 'package:deehelp/old_core/utils/url_launcher_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImeiCard extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onScan;
  final VoidCallback onPaste;
  final VoidCallback onClear;

  const ImeiCard({
    super.key,
    required this.controller,
    required this.onScan,
    required this.onPaste,
    required this.onClear,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return PageCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                HighlightIcon(
                  icon: Icon(
                    Icons.qr_code_scanner_outlined,
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
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(15),
              ],
              suffixIcon: controller.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: onClear,
                      icon: const Icon(Icons.close),
                      color: const Color(0xFF8A96C8),
                    ),
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
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: _primary.withOpacity(0.18)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: _primary, size: 18),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Você pode encontrar o IMEI em *#06* ou na caixa do aparelho.',
                      style: TextStyle(
                        fontSize: 12.5,
                        height: 1.3,
                        color: Color(0xFF6B7AAE),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
