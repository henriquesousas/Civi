import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/item_detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailSection extends ConsumerWidget {
  final Function(
    String title,
    String description,
    String examples,
  ) onModelPress;
  const DetailSection(this.onModelPress, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(updateProductViewModelProvider);
    return UICustomAppCard(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDetailTile(
            title: "Detalhes",
            subtitle: state.currentProduct!.obs ?? 'Não informado',
            showDivider: false,
            press: () => onModelPress(
              "Detalhes",
              "Adicione observações sobre o estado do veículo",
              "Exemplos: Amassado na porta, Risco na lateral, Parachoque traseiro quebrado",
            ),
          )
        ],
      ),
    );
  }
}
