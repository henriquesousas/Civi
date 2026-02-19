import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/image/export_image.dart';
import 'package:deehelp/core/utils/enum_utils.dart';
import 'package:deehelp/feature/items/detail/edit_args.dart';
import 'package:deehelp/feature/items/detail/provider/item_update_viewmodel_provider.dart';
import 'package:deehelp/feature/items/detail/provider/selected_item_provider.dart';
import 'package:deehelp/feature/items/detail/viewmodel/item_update_manager.dart';
import 'package:deehelp/feature/items/detail/viewmodel/product_update_state.dart';
import 'package:deehelp/feature/items/detail/widgets/danger_zone.dart';
import 'package:deehelp/feature/items/detail/widgets/editable_field_tile.dart';
import 'package:deehelp/feature/items/detail/widgets/header_card.dart';
import 'package:deehelp/feature/items/detail/widgets/photos_gallery_card.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/items/register/item_data.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/brand-picker/brand_bottom_sheet.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/section_title.dart';
import 'package:deehelp/feature/items/soft_divider.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/old_core/ui/extensions/dialog_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ItemDetailPage extends ConsumerStatefulWidget {
  const ItemDetailPage({super.key});

  @override
  ConsumerState<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends ConsumerState<ItemDetailPage> {
  int selectedPhoto = 0;
  final _pageCtrl = PageController();

  Future<void> _openPhotoViewer(
    BuildContext context,
    List<ImageMedia> photos,
    int initialIndex,
  ) async {
    await showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.92),
      builder: (_) => ImageViewDialog(
        photos: photos,
        initialIndex: initialIndex,
      ),
    );
  }

  void listener(Product item) {
    final provider = itemUpdateViewmodelProvider(item);
    ref.listen<ProductUpdateState>(
      provider,
      (oldState, currentState) {
        if (currentState.isSuccess) {
          // context.showSnackBar("Produto alterado com sucesso !");
          ref.watch(selectedItemProvider.notifier).state =
              currentState.currentProduct;
        }

        if (currentState.errorMessage != null &&
            currentState.errorMessage != oldState?.errorMessage) {
          context.showSnackBar(currentState.errorMessage!,
              type: DialogType.error);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = ref.watch(selectedItemProvider);
    if (item == null) return const Scaffold();
    final provider = itemUpdateViewmodelProvider(item);
    final state = ref.watch(provider);
    final viewModel = ref.watch(provider.notifier);
    final hintCode = item.type == ItemType.phone.name ? "IMEI" : 'Placa';

    listener(item);

    return Scaffold(
      appBar: DefaultAppBar(
        title: "Detalhes do item",
        press: () => context.pop(),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          if (item.type != ItemType.phone.name) ...[
            PhotosGalleryCard(
              photos: item.images,
              selectedIndex: selectedPhoto,
              onIndexChanged: (i) {
                if (!mounted) return;
                if (i == selectedPhoto) return;

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!mounted) return;
                  setState(() => selectedPhoto = i);
                });
              },
              controller: _pageCtrl,
              onOpenZoom: (i) => _openPhotoViewer(context, item.images, i),
            ),
            const SizedBox(height: SpacingSize.lg),
          ],
          HeaderCard(
            title: item.name,
            subtitle: 'Toque nos campos para editar',
            status: item.status,
          ),
          const SizedBox(height: SpacingSize.lg),
          const SectionTitle('Informações do item'),
          PageCard(
            child: Column(
              children: [
                EditableFieldTile(
                  icon: Icons.badge_outlined,
                  label: 'Nome',
                  value: item.name,
                  onEdit: () async {
                    final isUpdated = await context.push<bool>(
                      ItemsRouter.detailField,
                      extra: EditFieldArgs(
                        field: ItemField.name,
                        title: 'Nome',
                        label: 'Nome',
                        hint: 'Nome',
                        initialValue: item.name,
                      ),
                    );

                    if (!context.mounted) return;

                    if (isUpdated!) {
                      context.showSnackBar("nome alterado com sucesso");
                    }
                  },
                ),
                const SoftDivider(),
                EditableFieldTile(
                  icon: Icons.branding_watermark_outlined,
                  label: 'Marca',
                  value: item.brand,
                  isLoading: state.isLoading,
                  onEdit: () async {
                    final picked = await showModalBottomSheet<String>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (_) => BrandBottomSheet(
                        current: item.brand,
                        options: (getData(EnumUtils.fromString(
                                ItemType.values, item.type))
                            .toSet()
                            .toList()
                          ..sort()),
                      ),
                    );
                    if (picked != null) {
                      viewModel.onValueChange(
                        ItemField.brand,
                        picked,
                        '',
                        executeUpdate: true,
                      );
                    }
                  },
                ),
                const SoftDivider(),
                EditableFieldTile(
                  icon: Icons.color_lens_outlined,
                  label: 'Cor',
                  value: item.color,
                  onEdit: () {},
                ),
                const SoftDivider(),
                if (item.type != ItemType.phone.name) ...[
                  EditableFieldTile(
                    icon: Icons.calendar_month_outlined,
                    label: 'Ano',
                    value: "${item.year}",
                    onEdit: () {},
                  ),
                ],
                const SoftDivider(),
                EditableFieldTile(
                  icon: Icons.confirmation_number_outlined,
                  label: hintCode,
                  value: item.code,
                ),
              ],
            ),
          ),
          const SizedBox(height: SpacingSize.lg),
          const SectionTitle('Observação'),
          PageCard(
            child: EditableFieldTile(
              icon: Icons.notes_outlined,
              label: 'Descrição (até 300 caracteres)',
              value: item.obs ?? '',
              minHeight: 150,
              maxLines: 10,
              onEdit: () async {
                final isUpdated = await context.push<bool>(
                  ItemsRouter.detailField,
                  extra: EditFieldArgs(
                    title: "Descrição",
                    label: "Descrição",
                    helper:
                        "Descreva marcas, danos ou características únicas que ajudem a reconhecer este item.",
                    hint: hintCode,
                    initialValue: item.obs ?? '',
                    maxLen: 150,
                    maxLines: 8,
                    field: ItemField.obs,
                  ),
                );

                if (!context.mounted) return;

                if (isUpdated!) {
                  context.showSnackBar("descriçao alterado com sucesso");
                }
              },
            ),
          ),
          const SizedBox(height: SpacingSize.lg),
          DangerZone(
            onDelete: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Remover item?'),
                  content: const Text(
                    'Essa ação não pode ser desfeita. Deseja continuar?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Item removido (exemplo).')),
                        );
                      },
                      child: const Text('Remover'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
