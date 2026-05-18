import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/app_text_style.dart';
import 'package:deehelp/old_core/ui/widgets/textfield/text_field_primary.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/item_highticon.dart';
import 'package:flutter/cupertino.dart';

class ObservationCardField extends StatelessWidget {
  final Function(String)? onChanged;

  const ObservationCardField({super.key, this.onChanged});

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
                const ItemHighticon(
                  iconData: CupertinoIcons.doc_text,
                ),
                const SizedBox(width: SpacingSize.md),
                Expanded(
                  child: Text(
                    'Descrição (até 300 caracteres)',
                    style: context.appTextOld.bodySmall.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: SpacingSize.lg),
            TextFieldPrimary(
              hint: 'Digite detalhes que ajudem a identificar o item…',
              maxLength: 300,
              maxLines: 7,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
