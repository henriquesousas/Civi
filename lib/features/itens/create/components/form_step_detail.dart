import 'package:deehelp/app/theme/app_colors_v2.dart';
import 'package:deehelp/features/itens/create/components/step_colors.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../../shared/components/inputs/primary_text_field.dart';
import 'header.dart';

class FormStepDetail extends StatefulWidget {
  const FormStepDetail({super.key});

  @override
  State<FormStepDetail> createState() => _FormStepDetailState();
}

class _FormStepDetailState extends State<FormStepDetail> {
  int _currentIndex = 0;
  List<StepColors> colorsList = [
    StepColors(Colors.yellow, true),
    StepColors(Colors.red, false),
    StepColors(Colors.green, false),
    StepColors(Colors.grey, false),
    StepColors(Colors.blue, false),
    StepColors(Colors.white, false),
    StepColors(Colors.black, false),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          const Header(
            title: "Informe os detalhes",
            subtitle:
                "Preencha as informações importantes sobre o produto, como modelo, cor, placa ou número de série.",
          ),
          const SizedBox(height: 32),
          const PrimaryTextField(
            labelText: "Placa",
            hintText: "informe o número",
          ),
          const PrimaryTextField(
            labelText: "Marca",
            hintText: "Ex: VW, Fiat, BMW...",
          ),
          const SizedBox(height: 10),
          Text(
            "Selecione a cor",
            style: context.getTextStyle.regular.copyWith(
              color: AppColorsV2.textSecondary,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 10,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 35,
            ),
            itemCount: colorsList.length,
            itemBuilder: (context, index) {
              final item = colorsList[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                    for (var i = 0; i < colorsList.length; i++) {
                      colorsList[i].isSelected = false;
                    }
                    item.isSelected = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorsList[index].color,
                    border: Border.all(
                      color: Colors.grey[400]!,
                      width: item.isSelected ? 5 : 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: const Center(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
