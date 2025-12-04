import 'package:deehelp/features/my_products/view/create/create_product_cubit.dart';
import 'package:deehelp/features/my_products/view/create/state/create_product_state.dart';
import 'package:deehelp/features/my_products/view/create/widgets/product_choose_item_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/buttons/ui_elevated_button.dart';
import '../../../../../core/widgets/card/ui_custom_app_card.dart';

class StepChooseTypeProduct extends StatelessWidget {
  final VoidCallback press;
  const StepChooseTypeProduct({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: BlocConsumer<CreateProductCubit, CreateProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.maybeMap(
              data: (state) {
                return Column(
                  spacing: 10,
                  children: [
                    UICustomAppCard(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductChooseItemCardWidget(
                            types: state.items
                                .where((element) => element.identifier == 0)
                                .toList(),
                            title: "Veículos e Utiliários",
                            subTitle:
                                "Você está cadastrando um veículo de quatro rodas, podendo ser: (Carro, Pick-up, SUV ou Van)",
                          ),
                          ProductChooseItemCardWidget(
                            types: state.items
                                .where((element) => element.identifier == 1)
                                .toList(),
                            title: "Motos",
                            subTitle:
                                "Você está cadastrando um veículo de duas rodas, podendo ser: (Moto, Scooters,Ciclomotores)",
                          ),
                        ],
                      ),
                    ),
                    UIElevatedButton(
                      text: "Confirmar",
                      press: press,
                      isEnabled: state.hasItemSelected,
                    ),
                  ],
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
