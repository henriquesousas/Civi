import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/feature/items/register/widgets/photo/card_photo.dart';
import 'package:deehelp/feature/items/register/widgets/section_title.dart';
import 'package:deehelp/feature/items/register/widgets/wizard_step.dart';
import 'package:flutter/material.dart';

class ItemRegisterPhoto extends StatelessWidget {
  const ItemRegisterPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 110),
      children: const [
        WizardHeader(
          step: 3,
          title: "Fotos",
          subtitle: 'Envio fotos depois do cadastro concluído',
        ),
        SizedBox(height: SpacingSize.xl),
        SectionTitle('Fotos do item'),
        CardPhoto()
      ],
    );
  }
}
