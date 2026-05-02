import 'package:deehelp/v2/core/theme/size_layout_spacing.dart';
import 'package:deehelp/v2/feature/product/presentation/list/widgets/product_row.dart';
import 'package:deehelp/v2/feature/product/product_status.dart';
import 'package:deehelp/v2/feature/product/product_type.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      padding: const EdgeInsets.symmetric(
        horizontal: SizeLayoutSpacing.m,
      ),
      itemCount: 3,
      itemBuilder: (context, index) {
        return const ProductRow(
          title: 'Renault Sandero',
          subtitle: 'DND0171 • Vermelho • 2010',
          type: ProductType.car,
          status: ProductStatus.approved,
        );
      },
    );
  }
}
