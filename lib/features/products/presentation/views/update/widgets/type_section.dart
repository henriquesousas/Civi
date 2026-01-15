import 'package:deehelp/core/ui/widgets/bottom_sheet/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/products/external/repository/data.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/update/product_update_manager.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/item_detail_tile.dart';
import 'package:deehelp/features/products/presentation/widgets/modal_select_brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TypeSection extends ConsumerWidget {
  const TypeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(updateProductViewModelProvider.notifier);
    final state = ref.watch(updateProductViewModelProvider);
    return UICustomAppCard(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDetailTile(
            title: "Tipo",
            subtitle: state.currentProduct!.type,
            showDivider: false,
            press: () {
              customModalBottomSheet(
                context,
                child: ModalSelectBrand(
                  title: "Tipo do seu produto",
                  values: kTypes,
                  onChange: (value) {
                    viewModel.onValueChange(
                      ProductField.type,
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
