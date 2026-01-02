import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/item_detail_tile.dart';
import 'package:flutter/material.dart';

class TypeSection extends StatelessWidget {
  const TypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 3,
        children: [
          ItemDetailTile(
            title: "Tipo",
            subtitle: "",
            showDivider: false,
            press: () {
              // customModalBottomSheet(
              //   context,
              //   child: ModalSelectBrand(
              //     values: kTypes,
              //     onChange: (value) {
              //       context.pop();
              //     },
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
