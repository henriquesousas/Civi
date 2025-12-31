import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/bottom_sheet/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/external/repository/data.dart';
import 'package:deehelp/features/products/presentation/views/add/widget/grid_add_photo.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/edit_field_modal.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/item_detail_tile.dart';
import 'package:deehelp/features/products/presentation/widgets/modal_select_brand.dart';
import 'package:deehelp/features/products/presentation/widgets/modal_select_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductForm extends StatelessWidget {
  final Product product;
  final VoidCallback onConfirm;
  final VoidCallback onDelete;
  const ProductForm(
      {super.key,
      required this.product,
      required this.onConfirm,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        spacing: 10,
        children: [
          UICustomAppCard(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                ItemDetailTile(
                  title: "Fotos do ${product.name}",
                  subtitle: "${product.images.length} Foto(s)",
                  showDivider: false,
                  showIconEdit: false,
                  press: () async {},
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridAddPhoto(
                    photos: product.images,
                    onRemove: (_) {},
                  ),
                ),
              ],
            ),
          ),
          UICustomAppCard(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                ItemDetailTile(
                  title: "Marca",
                  subtitle: product.brand,
                  press: () {
                    // final modalCubit = context.read<ProductEditModalCubit>();
                    // final mainCubit = context.read<UpdateProductCubit>();
                    // modalCubit.initializeSafeCopy(product);
                    customModalBottomSheet(
                      context,
                      child: ModalSelectBrand(
                        values: kBrands,
                        onChange: (value) {
                          context.pop();
                        },
                      ),
                    );
                  },
                ),
                ItemDetailTile(
                  title: "Modelo",
                  subtitle: product.name,
                  press: () => _showTextFieldModal(
                      context: context,
                      initialValue: product.name,
                      title: "Modelo",
                      description: "Atualize informações do modelo do veículo",
                      examples: "Exemplos: Civic, Corolla, Onix, HB20",
                      // onChange: (value) => context
                      //     .read<ProductEditModalCubit>()
                      //     .changeModel(value),
                      onChange: (value) {},
                      onApplyChange: (_) {}
                      // onApplyChange: (value) => context
                      //     .read<UpdateProductCubit>()
                      //     .applyModelChange(value),
                      ),
                ),
                ItemDetailTile(
                  title: "Placa",
                  subtitle: product.code,
                  showIconEdit: false,
                  press: () {},
                ),
                ItemDetailTile(
                  title: "Cor",
                  subtitle: product.color,
                  showDivider: false,
                  press: () {
                    customModalBottomSheet(
                      context,
                      child: ModalSelectColor(
                        onChange: (value) {
                          context.pop();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          UICustomAppCard(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                ItemDetailTile(
                  title: "Tipo",
                  subtitle: product.type,
                  showDivider: false,
                  press: () {
                    customModalBottomSheet(
                      context,
                      child: ModalSelectBrand(
                        values: kTypes,
                        onChange: (value) {
                          context.pop();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          UICustomAppCard(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                ItemDetailTile(
                  title: "Detalhes",
                  subtitle: product.obs ?? '',
                  showDivider: false,
                  press: () => _showTextFieldModal(
                      context: context,
                      title: "Detalhes",
                      initialValue: product.obs ?? '',
                      description:
                          "Adicione observações sobre o estado do veículo",
                      examples:
                          "Exemplos: Amassado na porta, Risco na lateral, Parachoque traseiro quebrado",
                      isObs: true,
                      onChange: (v) {},
                      // onChange: (value) => context
                      //     .read<ProductEditModalCubit>()
                      //     .changeObs(value),
                      onApplyChange: (_) {}
                      // onApplyChange: (value) => context
                      //     .read<UpdateProductCubit>()
                      //     .applyObsChange(value),
                      ),
                )
              ],
            ),
          ),
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
    required BuildContext context,
    required String title,
    required String description,
    required String examples,
    required Function(String) onChange,
    required Function(String) onApplyChange,
    String initialValue = '',
    final isObs = false,
  }) {
    customModalBottomSheet(
      context,
      child: EditFieldModal(
        title: title,
        hintText: title,
        description: description,
        examples: examples,
        initialValue: initialValue,
        isObs: isObs,
        // initialValue: _getFieldValue(modalCubit, field),
        // errorText: errorText,
        // onConfirm: errorText == null ? (value) => onApplyChange(value) : null,
        onCancel: () => context.pop(),
        onChange: onChange,
      ),
    );
  }
}
