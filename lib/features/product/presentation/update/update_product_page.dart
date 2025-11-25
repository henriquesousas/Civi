import 'package:deehelp/core/components/dialogs/dialog_extension.dart';
import 'package:deehelp/core/components/loader/loading.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/features/product/presentation/update/components/product_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/router/router_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/animation/fade_slide_transition_animator.dart';
import '../../domain/entities/product.dart';
import '../listing/components/status_badge_widget.dart';
import 'state/product_update_state.dart';
import 'update_product_cubit.dart';

class UpdateProductPage extends StatefulWidget {
  final Product product;

  const UpdateProductPage({super.key, required this.product});

  static Future<Map<String, dynamic>?> navigate(
    BuildContext context,
    Product product,
  ) async {
    return await context.push<Map<String, dynamic>?>(
      RouterConstant.itemEdit,
      extra: product,
    );
  }

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
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
      "Apagar",
      "Deletar produto ${product.name}",
    );

    if (yes) {
      cubit.delete(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProductCubit, ProductUpdateState>(
      listener: (context, state) {
        state.maybeMap(
          editing: (value) {
            Loading.instance().show(context: context, text: "Aguarde...");
          },
          success: (state) {
            context.showSnackBar("Produto alterado com sucesso.");
            Loading.instance().hide();
            context.pop({
              'action': "update",
              'value': state.product,
            });
          },
          deleting: (state) {
            context.showSnackBar("Produto removido com sucesso.");
            Loading.instance().hide();
            context.pop({
              'action': "delete",
              'value': state.product,
            });
          },
          error: (value) {
            Loading.instance().hide();
          },
          orElse: () => Loading.instance().hide(),
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: UIAppBar(
            title: R.strings.detail,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
            ),
            actions: state.whenOrNull(
              load: (item) {
                return [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: StatusBadgeWidget(status: item.status),
                  ),
                ];
              },
            ),
          ),
          body: FadeSlideTransitionAnimator(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(18),
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
            ),
          ),
        );
      },
    );
  }
}
