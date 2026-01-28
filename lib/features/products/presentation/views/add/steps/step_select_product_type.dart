import 'package:deehelp/core/resources.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/add/state/add_product_state.dart';
import 'package:deehelp/features/products/presentation/views/add/widget/product_type_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepSelectProductType extends ConsumerWidget {
  final VoidCallback onContinue;
  const StepSelectProductType({
    super.key,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addProductViewModelProvider);
    final viewModel = ref.read(addProductViewModelProvider.notifier);

    return UICustomScaffold(
      hideAppBar: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.defaultPadding.w,
          vertical: Dimens.defaultPadding.w,
        ),
        child: UIElevatedButton(
          text: 'Continuar',
          press: onContinue,
          isEnabled: state.hasProductTypeSelected,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.zero,
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 10),
                  Text(
                    "O que você quer cadastrar ?",
                    style: context.appTextStyles.sectionTitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColorBody,
                    ),
                  ),

                  const SizedBox(height: 10),
                  ProductTypeCard(
                    title: "Automóvel",
                    description: "Carro, caminhão",
                    imageSrc: R.svg.car,
                    isSelected: state.productType == ProductType.car,
                    press: () => viewModel.selectProductType(ProductType.car),
                  ),
                  const SizedBox(height: 5),
                  // ProductTypeCard(
                  //   title: " Caminhões & Ônibus",
                  //   description:
                  //       "Registre roubo/furto de veículos pesados e transporte",
                  //   imageSrc: R.svg.truck,
                  //   isSelected: state.productType == ProductType.truck,
                  //   press: () => viewModel.selectProductType(ProductType.truck),
                  // ),
                  // const SizedBox(height: 5),
                  ProductTypeCard(
                    title: "Moto",
                    description:
                        "Motocicleta convencional, Motocicleta elétrica,Biz, etc...)",
                    imageSrc: R.svg.motorcycle,
                    isSelected: state.productType == ProductType.motorcycle,
                    press: () =>
                        viewModel.selectProductType(ProductType.motorcycle),
                  ),
                  SizedBox(height: Dimens.size20.w),
                  _buildTextInfo(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextInfo(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(
      //   horizontal: Dimens.defaultPadding.w,
      //   vertical: Dimens.defaultPadding.w,
      // ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor30,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "O que é o pré cadastro",
            style: context.appTextStyles.sectionTitle3.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Pré-cadastre seu veículo para facilitar e acelerar o registro de ocorrências. Em caso de roubo ou furto, você poderá fazer a denúncia rapidamente, usando os dados já salvos, sem perder tempo preenchendo formulários extensos.",
            textAlign: TextAlign.start,
            style: context.appTextStyles.sectionSubTitle1.copyWith(
              color: AppColors.darkGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
