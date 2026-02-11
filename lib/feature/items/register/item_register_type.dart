import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/cards/card_exports.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/items/register/widgets/section_title.dart';
import 'package:deehelp/feature/items/register/widgets/type_selector.dart';
import 'package:deehelp/feature/items/register/widgets/wizard_step.dart';
import 'package:flutter/material.dart';

class ItemRegisterType extends StatefulWidget {
  final VoidCallback press;
  const ItemRegisterType({
    super.key,
    required this.press,
  });

  @override
  State<ItemRegisterType> createState() => _ItemRegisterTypeState();
}

class _ItemRegisterTypeState extends State<ItemRegisterType> {
  ItemType? type;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 110),
      children: [
        const WizardHeader(
          step: 0,
          title: 'Tipo do item',
          subtitle: 'Escolha o tipo para continuar',
        ),
        const SizedBox(height: SpacingSize.lg),
        const SectionTitle('Selecione o tipo'),
        TypeSelector(
          selected: type,
          onSelect: (t) => setState(() => type = t),
        ),
        const SizedBox(height: SpacingSize.lg),
        CardHint(
            title: "Dicas",
            message:
                "Depois de criar o item, você poderá adicionar fotos para verificação e identificação.",
            icon: Icon(
              Icons.info_outline,
              color: context.primaryColor,
              size: IconSizes.md,
            ))
      ],
    );
  }
}
