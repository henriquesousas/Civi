import 'package:deehelp/core/components/dialogs/dialog_extension.dart';
import 'package:deehelp/core/components/loader/loading.dart';
import 'package:deehelp/features/base_page.dart';
import 'package:deehelp/features/base_page_state.dart';
import 'package:deehelp/features/product/presentation/update/components/product_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/resources.dart';
import '../../domain/entities/product.dart';
import 'state/product_update_state.dart';
import 'update_product_cubit.dart';

class UpdateProductPage
    extends BasePage<UpdateProductCubit, ProductUpdateState> {
  final Product product;

  const UpdateProductPage({super.key, required this.product});

  @override
  State<StatefulWidget> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends BasePageState<UpdateProductCubit,
    ProductUpdateState, UpdateProductPage> {
  @override
  void initState() {
    context.read<UpdateProductCubit>().load(widget.product);
    super.initState();
  }

  void _onConfirm() {
    context.read<UpdateProductCubit>().update();
  }

  void _onDelete(Product product) async {
    final cubit = context.read<UpdateProductCubit>();
    final yes = await context.showQuestionDialog(
      "Deletar",
      "Deletar produto ${product.name} ?",
    );

    if (yes) {
      cubit.delete(product);
    }
  }

  @override
  String? pageTitle() => R.strings.detail;

  @override
  void listener(BuildContext context, ProductUpdateState state) {
    state.maybeMap(
      editing: (value) {
        // Loading.instance().show(context: context, text: "Aguarde...");
      },
      success: (state) async {
        // Loading.instance().hide();
        context.pop({
          'action': "update",
          'message': "Produto alterado com sucesso.",
          'value': state.product,
        });
      },
      deleting: (state) {
        // context.showSnackBar("Produto removido com sucesso.");
        // Loading.instance().hide();
        context.pop({
          'action': "delete",
          'message': "Produto removido com sucesso.",
          'value': state.product,
        });
      },
      error: (value) {
        // Loading.instance().hide();
      },
      orElse: () => Loading.instance().hide(),
    );
  }

  @override
  Widget buildPage(BuildContext context, ProductUpdateState state) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: state.maybeMap(
        load: (state) => ProductForm(
          product: state.product,
          onConfirm: _onConfirm,
          onDelete: () => _onDelete(state.product),
        ),
        editing: (state) => ProductForm(
          product: state.product,
          onConfirm: _onConfirm,
          onDelete: () => _onDelete(state.product),
        ),
        deleting: (state) => ProductForm(
          product: state.product,
          onConfirm: _onConfirm,
          onDelete: () => _onDelete(state.product),
        ),
        orElse: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
