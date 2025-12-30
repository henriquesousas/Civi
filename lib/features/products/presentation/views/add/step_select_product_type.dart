import 'package:deehelp/core/ui/assets/resources.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
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

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    'Escolha uma das opções abaixo para continuar',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textColorBody,
                        ),
                  ),
                  const SizedBox(height: 10),
                  ProductTypeCard(
                    title: "Veiculos leves",
                    description: "Carros de passeio e utilitários leves",
                    imageSrc: R.images.svgIconCon,
                    isSelected: state.productType == ProductType.car,
                    press: () => viewModel.selectProductType(ProductType.car),
                  ),
                  const SizedBox(height: 5),
                  ProductTypeCard(
                    title: "Veiculos pesados",
                    description: "Caminhões e veículos de carga pesada",
                    imageSrc: R.images.svgIconTruck,
                    isSelected: state.productType == ProductType.truck,
                    press: () => viewModel.selectProductType(ProductType.truck),
                  ),
                  const SizedBox(height: 5),
                  ProductTypeCard(
                    title: "Veiculos de duas rodas",
                    description: "Motos, Scooters, Ciclomotores e similares",
                    imageSrc: R.images.svgIconMotorcycle,
                    isSelected: state.productType == ProductType.motorcycle,
                    press: () =>
                        viewModel.selectProductType(ProductType.motorcycle),
                  ),
                  const SizedBox(height: 20),
                  UIElevatedButton(
                    text: 'Continuar',
                    press: onContinue,
                    isEnabled: state.hasProductTypeSelected,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
