import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/bottom_sheet/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/update/state/product_update_state.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/brand_section.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/detail_section.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/edit_field_modal.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/photo_section.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/type_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductForm extends ConsumerWidget {
  const ProductForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(updateProductViewModelProvider.notifier);
    final state = ref.watch(updateProductViewModelProvider);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        spacing: 10,
        children: [
          const PhotoSection(),
          BrandSection(
            onModelPress: (title, description, examples) => _showTextFieldModal(
              ctx: context,
              initialValue: state.currentProduct!.name,
              title: title,
              description: description,
              examples: examples,
              onChange: (value) => viewModel.onValueChange(value, "model"),
              onModalClose: () => viewModel.restart(),
            ),
          ),
          const TypeSection(),
          const DetailSection(),
          UIElevatedButton(
            bgColor: AppColors.errorColor,
            text: "Deletar",
            press: () {},
          ),
        ],
      ),
    );
  }

  void _showTextFieldModal({
    required BuildContext ctx,
    required String title,
    required String description,
    required String examples,
    required Function(String) onChange,
    required String? initialValue,
    required VoidCallback? onModalClose,
    final isObs = false,
  }) async {
    await customModalBottomSheet(
      ctx,
      child: Consumer(
        builder: (consumerContext, ref, child) {
          ref.listen<ProductUpdateState>(
            updateProductViewModelProvider,
            (previous, currentState) {
              if (currentState.isSuccess) {
                ctx.pop();
              }
            },
          );
          return EditFieldModal(
            title: title,
            hintText: title,
            description: description,
            examples: examples,
            initialValue: initialValue ?? '',
            isObs: isObs,
            onCancel: () => ctx.pop(),
            onChange: onChange,
          );
        },
      ),
    );

    if (onModalClose != null) {
      onModalClose();
    }
  }
}
