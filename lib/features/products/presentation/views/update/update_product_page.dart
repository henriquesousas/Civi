import 'package:deehelp/core/base/base_page.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/product_form.dart';
import 'package:flutter/material.dart';

class UpdateProductPage extends BasePage {
  final Product product;
  const UpdateProductPage({super.key, required this.product});

  @override
  BasePageState<UpdateProductPage> createState() => _UpdateProductPage();
}

class _UpdateProductPage extends BasePageState<UpdateProductPage> {
  @override
  String? pageTitle() => "Detalhes";

  @override
  Widget buildPage(BuildContext context) {
    return ProductForm(
      product: widget.product,
      onConfirm: () {},
      onDelete: () {},
    );
  }
}
