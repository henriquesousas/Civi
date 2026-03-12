import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/cards/card_exports.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/section_title.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/type_selector.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/wizard_step.dart';
import 'package:deehelp/module/item/di/item_viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemRegisterType extends ConsumerStatefulWidget {
  const ItemRegisterType({
    super.key,
  });

  @override
  ConsumerState<ItemRegisterType> createState() => _ItemRegisterTypeState();
}

class _ItemRegisterTypeState extends ConsumerState<ItemRegisterType> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerItemViewModelProvider);
    final viewModel = ref.read(registerItemViewModelProvider.notifier);

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
          selected: state.type,
          onSelect: (value) => viewModel.selectProductType(value),
        ),
        const SizedBox(height: SpacingSize.xxl),
        CardHint(
          title: "Dicas",
          message:
              "Depois de criar o item, você poderá adicionar fotos para verificação e identificação.",
          icon: Icon(
            Icons.info_outline,
            color: context.primaryColor,
            size: IconSizes.md,
          ),
        )
      ],
    );
  }
}
