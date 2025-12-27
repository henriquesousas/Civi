import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/add/widget/product_choose_item_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepSelectProductType extends ConsumerWidget {
  final VoidCallback press;
  const StepSelectProductType({super.key, required this.press});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addProductViewModelProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: Dimens.defaultPadding.w,
          vertical: Dimens.defaultPadding.h,
        ),
        child: Column(
          spacing: 10,
          children: [
            UICustomAppCard(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductChooseItemCardWidget(
                    types: state.productTypes
                        .where((element) => element.identifier == 0)
                        .toList(),
                    title: "Veículos e Utiliários",
                    subTitle:
                        "Você está cadastrando um veículo de quatro rodas, podendo ser: (Carro, Pick-up, SUV ou Van)",
                  ),
                ],
              ),
            ),
            UICustomAppCard(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductChooseItemCardWidget(
                    types: state.productTypes
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
              isEnabled: state.hasProductTypeSelected,
            ),
          ],
        ),
      ),
    );
  }
}
