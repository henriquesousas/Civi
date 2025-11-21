import 'package:deehelp/core/components/container/ui_simple_container.dart';
import 'package:deehelp/core/components/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/features/itens/data/data.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/presentation/create/components/modal_select_color.dart';
import 'package:deehelp/features/itens/presentation/edit/cubit/item_update_cubit.dart';
import 'package:deehelp/features/itens/presentation/edit/cubit/item_update_state.dart';
import 'package:deehelp/features/itens/presentation/edit/edit_field_modal.dart';
import 'package:deehelp/features/itens/presentation/list/components/status_badge_widget.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors_v2.dart';
import '../../../../core/components/images/ui_network_image_with_loader.dart';
import '../../../../core/resources/resources.dart';
import '../../../../shared/animation/fade_slide_transition_animator.dart';
import '../create/components/modal_select_brand.dart';
import 'cubit/modal/item_modal_cubit.dart';
import 'cubit/modal/item_modal_state.dart';
import 'item_detail_tile.dart';
import 'item_edit_footer.dart';

class ItemEditPage extends StatefulWidget {
  final Item item;

  const ItemEditPage({super.key, required this.item});

  @override
  State<ItemEditPage> createState() => _ItemEditPageState();
}

class _ItemEditPageState extends State<ItemEditPage> {
  @override
  void initState() {
    context.read<ItemUpdateCubit>().load(widget.item);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ItemUpdateCubit, ItemUpdateState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColorsV2.background,
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
              child: state.maybeWhen(
                load: (item) {
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
                                subtitle: item.brand,
                                press: () {
                                  final modalCubit =
                                      context.read<ItemModalCubit>();
                                  final mainCubit =
                                      context.read<ItemUpdateCubit>();

                                  modalCubit.initializeSafeCopy(item);

                                  customModalBottomSheet(
                                    context,
                                    child: BlocProvider.value(
                                      value: modalCubit,
                                      child: BlocBuilder<ItemModalCubit,
                                          ItemModalState>(
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
                                subtitle: item.name,
                                press: () => _showTextFieldModal(
                                  context: context,
                                  item: item,
                                  title: R.strings.model,
                                  description: R.strings.modelUpdateDescription,
                                  examples: R.strings.modelUpdateExample,
                                  icon: Icons.directions_car,
                                  field: 'model',
                                  onChange: (value) => context
                                      .read<ItemModalCubit>()
                                      .changeModel(value),
                                  onApplyChange: (value) => context
                                      .read<ItemUpdateCubit>()
                                      .applyModelChange(value),
                                ),
                              ),
                              ItemDetailTile(
                                title: R.strings.plate,
                                subtitle: item.code,
                                showIconEdit: false,
                                press: () {},
                              ),
                              ItemDetailTile(
                                title: R.strings.color,
                                subtitle: item.color,
                                showDivider: false,
                                press: () {
                                  final modalCubit =
                                      context.read<ItemModalCubit>();
                                  final mainCubit =
                                      context.read<ItemUpdateCubit>();

                                  customModalBottomSheet(
                                    context,
                                    child: BlocProvider.value(
                                      value: modalCubit,
                                      child: BlocBuilder<ItemModalCubit,
                                          ItemModalState>(
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
                                subtitle: item.type,
                                showDivider: false,
                                press: () {
                                  final modalCubit =
                                      context.read<ItemModalCubit>();
                                  final mainCubit =
                                      context.read<ItemUpdateCubit>();

                                  modalCubit.initializeSafeCopy(item);

                                  customModalBottomSheet(
                                    context,
                                    child: BlocProvider.value(
                                      value: modalCubit,
                                      child: BlocBuilder<ItemModalCubit,
                                          ItemModalState>(
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
                                subtitle: item.obs ?? '',
                                showDivider: false,
                                press: () => _showTextFieldModal(
                                  context: context,
                                  item: item,
                                  title: R.strings.detail,
                                  description: R.strings.obsUpdateDescription,
                                  examples: R.strings.obsUpdateExample,
                                  icon: Icons.description,
                                  field: 'obs',
                                  onChange: (value) => context
                                      .read<ItemModalCubit>()
                                      .changeObs(value),
                                  onApplyChange: (value) => context
                                      .read<ItemUpdateCubit>()
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
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: UINetworkImageWithLoader(
                                  src: item.imageUrl ?? "",
                                  width: context.percentWidth(0.9),
                                  height: context.percentHeight(0.3),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ItemEditFooter(
                        onConfirm: () {},
                        onDelete: () {},
                      ),
                    ],
                  );
                },
                orElse: () {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _showTextFieldModal({
    required BuildContext context,
    required Item item,
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
