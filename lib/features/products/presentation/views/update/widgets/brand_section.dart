import 'package:deehelp/core/ui/widgets/bottom_sheet/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/products/external/repository/data.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/update/product_update_manager.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/item_detail_tile.dart';
import 'package:deehelp/features/products/presentation/widgets/modal_select_brand.dart';
import 'package:deehelp/features/products/presentation/widgets/modal_select_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BrandSection extends ConsumerWidget {
  final Function(
    String title,
    String description,
    String examples,
  ) onModelPress;
  const BrandSection({super.key, required this.onModelPress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(updateProductViewModelProvider);
    final viewModel = ref.watch(updateProductViewModelProvider.notifier);
    return UICustomAppCard(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 3,
        children: [
          ItemDetailTile(
            title: "Marca",
            subtitle: state.currentProduct!.brand,
            press: () async {
              await customModalBottomSheet(
                context,
                child: ModalSelectBrand(
                  title: "Selecione a marca do veículo",
                  values: kBrands,
                  onChange: (value) {
                    viewModel.onValueChange(
                      ProductField.brand,
                      value,
                      executeUpdate: true,
                    );
                    context.pop();
                  },
                ),
              );
            },
          ),
          ItemDetailTile(
            title: "Modelo",
            subtitle: state.currentProduct!.name,
            press: () => onModelPress(
              "Modelo",
              "Atualize informações do modelo do veículo",
              "Exemplos: Civic, Corolla, Onix, HB20",
            ),
          ),
          ItemDetailTile(
            title: "Placa",
            subtitle: state.currentProduct!.code,
            showIconEdit: false,
            press: () {},
          ),
          ItemDetailTile(
            title: "Cor",
            subtitle: state.currentProduct!.color,
            showDivider: false,
            press: () {
              customModalBottomSheet(
                context,
                child: ModalSelectColor(
                  onChange: (value) {
                    viewModel.onValueChange(
                      ProductField.color,
                      value,
                      executeUpdate: true,
                    );
                    context.pop();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
