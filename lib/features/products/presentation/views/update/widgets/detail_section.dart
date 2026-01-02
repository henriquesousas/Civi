import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/item_detail_tile.dart';
import 'package:flutter/material.dart';

class DetailSection extends StatelessWidget {
  const DetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const UICustomAppCard(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 3,
        children: [
          ItemDetailTile(
            title: "Detalhes",
            subtitle: "",
            showDivider: false,
            //   press: () => _showTextFieldModal(
            //       context: context,
            //       title: "Detalhes",
            //       initialValue: product.obs ?? '',
            //       description:
            //           "Adicione observações sobre o estado do veículo",
            //       examples:
            //           "Exemplos: Amassado na porta, Risco na lateral, Parachoque traseiro quebrado",
            //       isObs: true,
            //       onChange: (v) {},
            //       errorSelector: (state) {},
            //       onApplyChange: (_) {}),
          )
        ],
      ),
    );
  }
}
