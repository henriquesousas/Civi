import 'package:flutter/material.dart';

import '../../../shared/components/inputs/primary_text_field.dart';
import 'header.dart';

class FormStepObs extends StatelessWidget {
  const FormStepObs({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Header(
            title: "Alguma observação?",
            subtitle:
                "Adicione informações adicionais que possam ajudar, como características únicas ou circunstâncias do ocorrido.",
          ),
          SizedBox(height: 32),
          PrimaryTextField(
            labelText: "Observação",
            hintText: "Ex: amassado na lateral esquerda...",
            maxLine: 5,
          ),
        ],
      ),
    );
    ;
  }
}
