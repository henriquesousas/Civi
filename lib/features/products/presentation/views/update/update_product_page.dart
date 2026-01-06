import 'package:deehelp/core/base/base_page.dart';
import 'package:deehelp/core/extensions/dialog_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/update/state/product_update_state.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/product_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

        if (currentState.isSuccess) {
          context.pop();
          context.showSnackBar(
            currentState.successMessage ?? "Operação realizada com sucesso!",
          );
          ref
              .watch(productListingViewmodelProvider.notifier)
              .refresh(currentState.currentProduct!);
        }
      },
    );
    super.listener();
  }

  @override
  Widget? buildBottomNavigationBar() {
    final state = ref.watch(updateProductViewModelProvider);
    final viewModel = ref.watch(updateProductViewModelProvider.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.defaultPadding.w,
        vertical: Dimens.defaultPadding.w,
      ),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: UIElevatedButton(
              icon: const Icon(
                Icons.delete_outline,
                color: AppColors.errorColorDark,
              ),
              bgColor: Colors.transparent,
              borderColor: AppColors.errorColorDark,
              textColor: AppColors.errorColorDark,
              text: "Apagar cadastro",
              isLoading: state.deletingProduct,
              press: () async {
                if (state.currentProduct != null) {
                  final yes = await context.showQuestionDialog(
                    "Apagar",
                    "Tem certeza que deseja remover permanentemente o produto ${state.currentProduct?.name} da sua grade?",
                  );

                  if (yes) {
                    viewModel.deleteProduct();
                  }
                }
              },
            ),
          ),
          Expanded(
            child: UIElevatedButton(
              text: 'Confirmar',
              isLoading: ref.watch(updateProductViewModelProvider).isLoading,
              press: () {
                if (!state.hasChangeSomeField) {
                  context.pop();
                  return;
                }
                viewModel.updatreProduct();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return const ProductForm();
  }
}
