import 'package:deehelp/features/products/presentation/views/add/widget/grid_add_photo.dart';
import 'package:deehelp/features/products/presentation/widgets/modal_select_brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/ui/widgets/bottom_sheet/custom_modal_bottom_sheet.dart';
import '../../../../../../core/ui/widgets/card/ui_custom_app_card.dart';
import '../../../../external/repository/data.dart';
import '../../../../domain/entities/product.dart';
import '../../../widgets/modal_select_color.dart';
import '../product_edit_modal_cubit.dart';
import '../state/item_modal_state.dart';
import '../update_product_cubit.dart';
import 'edit_field_modal.dart';
import 'item_detail_tile.dart';
import 'item_edit_footer.dart';

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
                  title: "Marca",
                  subtitle: product.brand,
                  press: () {
                    // final modalCubit = context.read<ProductEditModalCubit>();
                    // final mainCubit = context.read<UpdateProductCubit>();

                    // modalCubit.initializeSafeCopy(product);

                    // customModalBottomSheet(
                    //   context,
                    //   child: BlocProvider.value(
                    //     value: modalCubit,
                    //     child:
                    //         BlocBuilder<ProductEditModalCubit, ItemModalState>(
                    //       builder: (context, modalState) {
                    //         return ModalSelectBrand(
                    //           values: kBrands,
                    //           onChange: (value) {
                    //             mainCubit.applyBrandChange(value);
                    //             context.pop();
                    //           },
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // );
                  },
                ),
                ItemDetailTile(
                  title: "Modelo",
                  subtitle: product.name,
                  press: () => _showTextFieldModal(
                      context: context,
                      item: product,
                      title: "Modelo",
                      description: "Atualize informações do modelo do veículo",
                      examples: "Exemplos: Civic, Corolla, Onix, HB20",
                      icon: Icons.directions_car,
                      field: 'model',
                      onChange: (value) => context
                          .read<ProductEditModalCubit>()
                          .changeModel(value),
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
                    // final modalCubit = context.read<ProductEditModalCubit>();
                    // final mainCubit = context.read<UpdateProductCubit>();

                    // customModalBottomSheet(
                    //   context,
                    //   child: BlocProvider.value(
                    //     value: modalCubit,
                    //     child:
                    //         BlocBuilder<ProductEditModalCubit, ItemModalState>(
                    //       builder: (context, modalState) {
                    //         return ModalSelectColor(
                    //           onChange: (value) {
                    //             mainCubit.applyColorChange(value);
                    //             context.pop();
                    //           },
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // );
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
                    // final modalCubit = context.read<ProductEditModalCubit>();
                    // final mainCubit = context.read<UpdateProductCubit>();

                    // modalCubit.initializeSafeCopy(product);

                    // customModalBottomSheet(
                    //   context,
                    //   child: BlocProvider.value(
                    //     value: modalCubit,
                    //     child:
                    //         BlocBuilder<ProductEditModalCubit, ItemModalState>(
                    //       builder: (context, modalState) {
                    //         return ModalSelectBrand(
                    //           values: kTypes,
                    //           onChange: (value) {
                    //             mainCubit.applyTypeChange(value);
                    //             context.pop();
                    //           },
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // );
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
                      item: product,
                      title: "Detalhes",
                      description:
                          "Adicione observações sobre o estado do veículo",
                      examples:
                          "Exemplos: Amassado na porta, Risco na lateral, Parachoque traseiro quebrado",
                      icon: Icons.description,
                      field: 'obs',
                      onChange: (value) => context
                          .read<ProductEditModalCubit>()
                          .changeObs(value),
                      onApplyChange: (_) {}
                      // onApplyChange: (value) => context
                      //     .read<UpdateProductCubit>()
                      //     .applyObsChange(value),
                      ),
                )
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
                  title: "Fotos",
                  subtitle: "1 Foto(s)",
                  showDivider: false,
                  showCam: true,
                  press: () async {
                    // final cubit = context.read<UpdateProductCubit>();
                    // final image =
                    //     await DefaultImagePicker().pickImageFromGallery();
                    // if (image != null) {
                    //   cubit.applyImageChange(image);
                    // }
                  },
                ),
                GridAddPhoto(
                  photos: product.images,
                  onRemove: (_) {},
                )

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: product.image?.source == MediaSource.api
                //       ? UIMyAssetsImageWidget(
                //           assetPath: 'product.image?.file.path ?? ""',
                //           width: context.percentWidth(0.9),
                //           height: context.percentHeight(0.3),
                //         )
                //       : Container(
                //           width: context.percentWidth(0.9),
                //           height: context.percentHeight(0.3),
                //           decoration: BoxDecoration(
                //             border: Border.all(
                //               color: AppColors.primaryColor,
                //               width: 3.0,
                //             ),
                //             borderRadius: BorderRadius.circular(20),
                //             image: DecorationImage(
                //               image: FileImage(product.image!.file),
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         ),
                // ),
              ],
            ),
          ),
          ItemEditFooter(
            onConfirm: onConfirm,
            onDelete: onDelete,
          ),
        ],
      ),
    );
  }

  void _showTextFieldModal({
    required BuildContext context,
    required Product item,
    required String title,
    required String description,
    required String examples,
    required IconData icon,
    required String field,
    required Function(String) onChange,
    required Function(String) onApplyChange,
  }) {
    final modalCubit = context.read<ProductEditModalCubit>();

    modalCubit.initializeSafeCopy(item);

    customModalBottomSheet(
      context,
      child: BlocProvider.value(
        value: modalCubit,
        child: BlocBuilder<ProductEditModalCubit, ItemModalState>(
          builder: (context, state) {
            final modalCubit = context.read<ProductEditModalCubit>();
            final errorText = state.maybeMap(
              validation: (state) => state.field == field ? state.error : null,
              orElse: () => null,
            );

            return EditFieldModal(
              title: title,
              hintText: title,
              description: description,
              examples: examples,
              prefixIcon: icon,
              initialValue: _getFieldValue(modalCubit, field),
              errorText: errorText,
              onConfirm:
                  errorText == null ? (value) => onApplyChange(value) : null,
              onCancel: () => context.pop(),
              onChange: onChange,
            );
          },
        ),
      ),
    );
  }

  String _getFieldValue(ProductEditModalCubit cubit, String field) {
    switch (field) {
      case 'model':
        return cubit.currentModel;
      case 'obs':
        return cubit.currentObservation;
      default:
        return '';
    }
  }
}
