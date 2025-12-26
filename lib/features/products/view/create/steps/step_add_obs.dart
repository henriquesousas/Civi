import 'package:deehelp/features/products/view/create/create_product_cubit.dart';
import 'package:deehelp/features/products/view/create/state/create_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/ui/widgets/card/ui_custom_app_card.dart';
import '../../../../../core/ui/widgets/textfield/ui_text_field_rounded.dart';
import '../widgets/header_text_card.dart';

class StepAddObs extends StatelessWidget {
  const StepAddObs({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateProductCubit>();
    return UICustomAppCard(
      child: BlocConsumer<CreateProductCubit, CreateProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
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
                onChanged: (value) => cubit.onObsChange(value),
              ),
            ],
          );
        },
      ),
    );
  }
}
