import 'package:deehelp/core/components/container/ui_simple_container.dart';
import 'package:deehelp/core/components/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/components/dialogs/dialog_extension.dart';
import 'package:deehelp/core/components/loader/loading.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/core/services/media/image_picker_service.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/images/ui_network_image_with_loader.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/animation/fade_slide_transition_animator.dart';
import '../../data/data.dart';
import '../../domain/entities/image_media.dart';
import '../../domain/entities/product.dart';
import '../create/components/modal_select_brand.dart';
import '../create/components/modal_select_color.dart';
import '../listing/components/status_badge_widget.dart';
import 'components/edit_field_modal.dart';
import 'components/item_detail_tile.dart';
import 'components/item_edit_footer.dart';
import 'cubit/modal/item_modal_cubit.dart';
import 'cubit/modal/item_modal_state.dart';
import 'cubit/product_update_state.dart';
import 'cubit/update_product_cubit.dart';

class UpdateProductPage extends StatefulWidget {
  final Product item;

  const UpdateProductPage({super.key, required this.item});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  @override
  void initState() {
    context.read<UpdateProductCubit>().load(widget.item);
    super.initState();
  }

  void _update() {
    context.read<UpdateProductCubit>().update();
  }

  void _delete() {}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProductCubit, ProductUpdateState>(
      listener: (context, state) {
        state.maybeMap(
          editing: (value) =>
              Loading.instance().show(context: context, text: "Aguarde..."),
          success: (value) {
            context.showSnackBar("Produto alterado com sucesso.");
            Loading.instance().hide();
            context.pop();
          },
          error: (value) {},
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
                load: (product) => _form(product.product),
                editing: (product) => _form(product.product),
                orElse: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _form(Product product) {
    return Column(
      spacing: 10,
      children: [
        UISimpleContainer(
          padding: const EdgeInsets.all(3),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                ItemDetailTile(
                  title: R.strings.brand,
                  subtitle: product.brand,
                  press: () {
                    final modalCubit = context.read<ItemModalCubit>();
                    final mainCubit = context.read<UpdateProductCubit>();

                    modalCubit.initializeSafeCopy(product);

                    customModalBottomSheet(
                      context,
                      child: BlocProvider.value(
                        value: modalCubit,
                        child: BlocBuilder<ItemModalCubit, ItemModalState>(
                          builder: (context, modalState) {
                            return ModalSelectBrand(
                              values: brands,
                              onChange: (value) {
                                mainCubit.applyBrandChange(value);
                                context.pop();
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                ItemDetailTile(
                  title: R.strings.model,
                  subtitle: product.name,
                  press: () => _showTextFieldModal(
                    context: context,
                    item: product,
                    title: R.strings.model,
                    description: R.strings.modelUpdateDescription,
                    examples: R.strings.modelUpdateExample,
                    icon: Icons.directions_car,
                    field: 'model',
                    onChange: (value) =>
                        context.read<ItemModalCubit>().changeModel(value),
                    onApplyChange: (value) => context
                        .read<UpdateProductCubit>()
                        .applyModelChange(value),
                  ),
                ),
                ItemDetailTile(
                  title: R.strings.plate,
                  subtitle: product.code,
                  showIconEdit: false,
                  press: () {},
                ),
                ItemDetailTile(
                  title: R.strings.color,
                  subtitle: product.color,
                  showDivider: false,
                  press: () {
                    final modalCubit = context.read<ItemModalCubit>();
                    final mainCubit = context.read<UpdateProductCubit>();

                    customModalBottomSheet(
                      context,
                      child: BlocProvider.value(
                        value: modalCubit,
                        child: BlocBuilder<ItemModalCubit, ItemModalState>(
                          builder: (context, modalState) {
                            return ModalSelectColor(
                              onChange: (value) {
                                mainCubit.applyColorChange(value);
                                context.pop();
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        UISimpleContainer(
          padding: const EdgeInsets.all(2),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                ItemDetailTile(
                  title: R.strings.type,
                  subtitle: product.type,
                  showDivider: false,
                  press: () {
                    final modalCubit = context.read<ItemModalCubit>();
                    final mainCubit = context.read<UpdateProductCubit>();

                    modalCubit.initializeSafeCopy(product);

                    customModalBottomSheet(
                      context,
                      child: BlocProvider.value(
                        value: modalCubit,
                        child: BlocBuilder<ItemModalCubit, ItemModalState>(
                          builder: (context, modalState) {
                            return ModalSelectBrand(
                              values: types,
                              onChange: (value) {
                                mainCubit.applyTypeChange(value);
                                context.pop();
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        UISimpleContainer(
          padding: const EdgeInsets.all(2),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                ItemDetailTile(
                  title: R.strings.detail,
                  subtitle: product.obs ?? '',
                  showDivider: false,
                  press: () => _showTextFieldModal(
                    context: context,
                    item: product,
                    title: R.strings.detail,
                    description: R.strings.obsUpdateDescription,
                    examples: R.strings.obsUpdateExample,
                    icon: Icons.description,
                    field: 'obs',
                    onChange: (value) =>
                        context.read<ItemModalCubit>().changeObs(value),
                    onApplyChange: (value) => context
                        .read<UpdateProductCubit>()
                        .applyObsChange(value),
                  ),
                )
              ],
            ),
          ],
        ),
        UISimpleContainer(
          padding: const EdgeInsets.all(2),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                ItemDetailTile(
                  title: R.strings.photos,
                  subtitle: "1 ${R.strings.photos}(s)",
                  showDivider: false,
                  showCam: true,
                  press: () async {
                    final cubit = context.read<UpdateProductCubit>();
                    final image =
                        await ImagePickerService().pickImageFromGallery();
                    if (image != null) {
                      if (mounted) {
                        cubit.applyImageChange(image);
                      }
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: product.image?.source == MediaSource.api
                      ? UINetworkImageWithLoader(
                          src: product.image?.file.path ?? "",
                          width: context.percentWidth(0.9),
                          height: context.percentHeight(0.3),
                        )
                      : Container(
                          width: context.percentWidth(0.9),
                          height: context.percentHeight(0.3),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: FileImage(product.image!.file),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
        ItemEditFooter(
          onConfirm: () => _update(),
          onDelete: () => _delete(),
        ),
      ],
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
    final modalCubit = context.read<ItemModalCubit>();

    modalCubit.initializeSafeCopy(item);

    customModalBottomSheet(
      context,
      child: BlocProvider.value(
        value: modalCubit,
        child: BlocBuilder<ItemModalCubit, ItemModalState>(
          builder: (context, state) {
            final modalCubit = context.read<ItemModalCubit>();
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

  String _getFieldValue(ItemModalCubit cubit, String field) {
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
