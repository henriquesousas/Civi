import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/textfield/text_field_primary.dart';
import 'package:deehelp/feature/items/register/widgets/card_page.dart';
import 'package:deehelp/feature/items/register/widgets/item_highticon.dart';
import 'package:flutter/material.dart';

class ObservationCardField extends StatelessWidget {
  final TextEditingController controller;

  const ObservationCardField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const ItemHighticon(iconData: Icons.notes_outlined),
                const SizedBox(width: SpacingSize.md),
                Expanded(
                  child: Text(
                    'Descrição (até 300 caracteres)',
                    style: context.appText.bodySmall.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: SpacingSize.md),
            TextFieldPrimary(
              controller: controller,
              hint: 'Digite detalhes que ajudem a identificar o item…',
              maxLength: 300,
              maxLines: 7,
            ),
          ],
        ),
      ),
    );
  }
}
