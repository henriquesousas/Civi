import 'package:deehelp/features/my_products/view/create/widgets/product_choose_type_card.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/buttons/ui_elevated_button.dart';
import '../../../../core/widgets/card/ui_custom_app_card.dart';

class CreateProductStepChooseTypePage extends StatelessWidget {
  final VoidCallback press;
  const CreateProductStepChooseTypePage({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          spacing: 10,
          children: [
            UICustomAppCard(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductChooseTypeCard(
                    type: ChooseTypeModel.buildVehicleOption(),
                  ),
                  ProductChooseTypeCard(
                      type: ChooseTypeModel.buildMotorcycleOption()),
                ],
              ),
            ),
            UIElevatedButton(text: "Confirmar", onTap: press),
          ],
        ),
      ),
    );
  }
}
