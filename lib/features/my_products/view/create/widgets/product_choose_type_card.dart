import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/features/my_products/view/create/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/ui_my_assets_image_widget.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/dimens.dart';
import '../../../../../core/widgets/card/ui_custom_app_card.dart';
import 'header_text.dart';
import 'label_text.dart';

class ChooseTypeCardModel {
  final String title;
  final String srcImage;

  ChooseTypeCardModel({required this.title, required this.srcImage});
}

class ChooseTypeModel {
  final String textHeader;
  final String textBody;
  final List<ChooseTypeCardModel> items;

  ChooseTypeModel({
    required this.textHeader,
    required this.textBody,
    required this.items,
  });

  factory ChooseTypeModel.buildVehicleOption() {
    final items = [
      ChooseTypeCardModel(
        title: "Veículos leves",
        srcImage: R.images.svgIconCon,
      ),
      ChooseTypeCardModel(
        title: "Veículos pesados",
        srcImage: R.images.svgIconTruck,
      ),
    ];
    return ChooseTypeModel(
      textHeader: "Veículos e Utiliários",
      textBody:
          "Você está cadastrando um veículo de quatro rodas, podendo ser: (Carro, Pick-up, SUV ou Van)",
      items: items,
    );
  }

  factory ChooseTypeModel.buildMotorcycleOption() {
    final items = [
      ChooseTypeCardModel(
        title: "Veículos de duas rodas",
        srcImage: R.images.svgIconMotorcycle,
      ),
    ];
    return ChooseTypeModel(
      textHeader: "Motos",
      textBody:
          "Você está cadastrando um veículo de duas rodas, podendo ser: Moto,Scooter, Ciclomotor)",
      items: items,
    );
  }
}

class ProductChooseTypeCard extends StatelessWidget {
  final ChooseTypeModel type;
  const ProductChooseTypeCard({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 3,
        children: [
          LabelText(
            textAlign: TextAlign.start,
            text: type.textHeader,
            isRequired: true,
          ),
          SmallText(
            text: type.textBody,
            textAlign: TextAlign.start,
            maxLine: 100,
            textStyle: context.appTextStyles.caption2Style.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 10),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                type.items.length,
                (index) {
                  return Expanded(
                    child: UICustomAppCard(
                      margin: index == 0
                          ? const EdgeInsetsDirectional.only(
                              end: 10,
                            )
                          : EdgeInsets.zero,
                      backgroundColor: AppColors.whiteColor,
                      borderColor: AppColors.lightGreyColor20,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      radius: Dimens.cardExtraRadius,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UIMyAssetsImageWidget(
                            isSvg: true,
                            assetPath: index == 0
                                ? R.images.svgIconCon
                                : R.images.svgIconTruck,
                            boxFit: BoxFit.contain,
                            width: double.infinity,
                            height: 25,
                            color: AppColors.blackColor.withValues(alpha: 1),
                          ),
                          HeaderText(
                            text: index == 0
                                ? "Veículos leves"
                                : "Veículos pesados",
                            textStyle:
                                context.appTextStyles.caption1Style.copyWith(
                              color: AppColors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
