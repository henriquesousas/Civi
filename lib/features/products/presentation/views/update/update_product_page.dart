import 'package:deehelp/core/base/base_page.dart';
import 'package:deehelp/core/extensions/dialog_extension.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/update/state/product_update_state.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/product_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  VoidCallback? onBackPress() {
    return () => context.pop();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(updateProductViewModelProvider.notifier).initialize(
            widget.product,
          );
    });
  }

  @override
  void listener() {
    ref.listen<ProductUpdateState>(
      updateProductViewModelProvider,
      (previous, currentState) {
        if (currentState.errorMessage != null) {
          context.showSnackBar(
            currentState.errorMessage!,
            type: DialogType.error,
          );
        }
      },
    );
    super.listener();
  }

  @override
  Widget buildPage(BuildContext context) {
    return const ProductForm();
  }
}
