import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/ui/widgets/card/ui_custom_app_card.dart';
import '../../../../../../core/ui/widgets/textfield/ui_text_field_rounded.dart';
import '../widget/header_text_card.dart';

class StepAddObs extends ConsumerWidget {
  const StepAddObs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(addProductViewModelProvider.notifier);
    return UICustomAppCard(
      child: Column(
        children: [
          const HeaderTextCard(
            header: "Alguma obervação ?",
            text:
                "Adicione informações que possam ajudar, como características únicas ou circunstâncias do veículo.",
          ),
          const SizedBox(height: 10),
          UITextFieldRounded(
            isRequired: true,
            showLabelText: false,
            labelText: "",
            hintText: "Ex: Amassado na porta, farol trincado, etc...",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            maxLength: 100,
            maxLine: 5,
            onChanged: (value) => viewModel.onObsChange(value),
          ),
        ],
      ),
    );
  }
}
