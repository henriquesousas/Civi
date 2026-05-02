import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/feature/product/presentation/list/widgets/add_new.dart';
import 'package:deehelp/v2/feature/product/presentation/list/widgets/product_list.dart';
import 'package:deehelp/v2/feature/product/presentation/list/widgets/top_description.dart';
import 'package:deehelp/v2/feature/product/product_item.dart';
import 'package:deehelp/v2/feature/product/product_status.dart';
import 'package:deehelp/v2/feature/product/product_type.dart';
import 'package:flutter/material.dart';

const allProducts = [
  ProductItem(
    title: 'Honda Civic',
    subtitle: 'Preto • 2010 • DND-0171',
    status: ProductStatus.approved,
    type: ProductType.car,
  ),
  ProductItem(
    title: 'Honda Civic',
    subtitle: 'Preto • 2010 • DND-0171',
    status: ProductStatus.approved,
    type: ProductType.car,
  ),
  ProductItem(
    title: 'Honda Civic',
    subtitle: 'Preto • 2010 • DND-0171',
    status: ProductStatus.approved,
    type: ProductType.car,
  ),
  ProductItem(
    title: 'Honda Civic',
    subtitle: 'Preto • 2010 • DND-0171',
    status: ProductStatus.approved,
    type: ProductType.car,
  ),
  ProductItem(
    title: 'CG Titan 150',
    subtitle: 'Vermelha • 2018 • ABC-1234',
    status: ProductStatus.pending,
    type: ProductType.motorcycle,
  ),
  ProductItem(
    title: 'iPhone 13',
    subtitle: 'Azul • IMEI cadastrado',
    status: ProductStatus.canceled,
    type: ProductType.phone,
  ),
];

class ListProductPage extends StatefulWidget {
  const ListProductPage({super.key});

  @override
  State<ListProductPage> createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "Meus produtos",
        showBackButton: true,
        press: () {},
      ),
      body: const SafeArea(
        child: Column(
          children: [
            TopDescription(),
            SizedBox(height: SizeSpacing.s),
            AddNew(),
            SizedBox(height: SizeSpacing.s),
            Expanded(child: ProductList()),
          ],
        ),
      ),
    );
  }
}
