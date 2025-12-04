import 'package:flutter/material.dart';

import '../../../../../core/widgets/card/ui_custom_app_card.dart';
import '../../../../../core/widgets/text-field/ui_text_field_rounded.dart';
import '../widgets/header_text_card.dart';

class StepAddObs extends StatelessWidget {
  const StepAddObs({super.key});

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      child: Column(
        children: [
          const HeaderTextCard(
            header: "Alguma obervação ?",
            text:
                "Adicione informações adicionais que possam ajudar, como características únicas ou circunstâncias do veículo.",
          ),
          const SizedBox(height: 10),
          UITextFieldRounded(
            isRequired: true,
            showLabelText: false,
            labelText: "Modelo",
            hintText: "Observação",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            maxLength: 100,
            maxLine: 5,
            onChanged: (value) {
              // controller.selectedCardHolder?.name = value;
            },
            validator: (value) {
              // controller.selectedCardHolder?.name = value;
              // if (value.toString().trim().isEmpty) {
              //   return MyStrings.kNameNullError.tr;
              // } else {
              //   return null;
              // }
            },
          ),
        ],
      ),
    );
  }
}
