import 'package:deehelp/v2/core/theme/size_layout_spacing.dart';
import 'package:deehelp/v2/feature/product/presentation/list/widgets/row_product_tile.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeLayoutSpacing.m,
      ),
      itemCount: 3,
      itemBuilder: (context, index) {
        return const RowProductTile(
          title: 'Renault Sandero',
          subtitle:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy',
        );
      },
    );
  }
}
