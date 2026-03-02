import 'dart:ui';

import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
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
import 'package:deehelp/feature/items/register/presentation/widgets/color-picker/color_bottom_sheet.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/color-picker/color_option.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/section_title.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/year-picker/year_bottom_sheet.dart';
import 'package:deehelp/feature/items/soft_divider.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/core/extension/dialog_extension.dart';
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
    final provider = itemUpdateViewmodelProvider(item.id.value);
    ref.listen<ProductUpdateState>(
      provider,
      (oldState, currentState) {
        if (currentState.isSuccess) {
          ref.watch(selectedItemProvider.notifier).state =
              currentState.currentProduct;
        }

        if (currentState.errorMessage != null &&
            currentState.errorMessage != oldState?.errorMessage) {
          final navigator = Navigator.of(context, rootNavigator: true);
          // 1️⃣ Fecha o dialog (loading)
          if (navigator.canPop()) {
            navigator.pop();
          }
          context.showTopNotice(
              "Não foi possível realizar esta operação o erro foi por que provavelmente o item a ser excluido deve ter um incidente relacionado a ele",
              type: DialogType.error);
          // context.showSnackBar(currentState.errorMessage!,
          //     type: DialogType.error);
        }

        if (currentState.deleteSuccess) {
          final navigator = Navigator.of(context, rootNavigator: true);
          // 1️⃣ Fecha o dialog (loading)
          if (navigator.canPop()) {
            navigator.pop();
          }

          // 2️⃣ Fecha a tela atual
          if (navigator.canPop()) {
            navigator.pop({
              "args": {
                "operation": "delete",
                "status": true,
              },
            });
          }
        }

        if (currentState.deletingProduct) {
          showDeletingOverlay(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = ref.watch(selectedItemProvider);
    if (item == null) return const Scaffold();
    final provider = itemUpdateViewmodelProvider(item.id.value);
    final state = ref.watch(provider);
    final viewModel = ref.watch(provider.notifier);
    final hintCode = item.type == ItemType.phone.name ? "IMEI" : 'Placa';

    listener(item);

    return Scaffold(
      appBar: DefaultAppBar(
        title: "Detalhes do item",
        showBackButton: true,
        press: () => context.pop(),
        actions: item.type != ItemType.phone.name
            ? [
                TextButton(
                  child: const Text("Editar fotos"),
                  onPressed: () => context.push(ItemsRouter.updatePhoto),
                ),
              ]
            : null,
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
                  isLoading: state.brandUpdateLoad,
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
                  isLoading: state.colorUpdateLoad,
                  onEdit: () async {
                    final picked = await showModalBottomSheet<ColorOption>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (_) => ColorBottomSheet(
                        current: item.color,
                        options: const [
                          ColorOption('Preto', Color(0xFF1F2A44)),
                          ColorOption('Branco', Color(0xFFFFFFFF),
                              border: Color(0xFFE6EAF6)),
                          ColorOption('Cinza', Color(0xFF9AA4B2)),
                          ColorOption('Prata', Color(0xFFC7CDD6)),
                          ColorOption('Vermelho', Color(0xFFE53935)),
                          ColorOption('Azul', Color(0xFF1E88E5)),
                          ColorOption('Verde', Color(0xFF43A047)),
                          ColorOption('Amarelo', Color(0xFFFDD835)),
                          ColorOption('Laranja', Color(0xFFFB8C00)),
                          ColorOption('Marrom', Color(0xFF6D4C41)),
                          ColorOption('Roxo', Color(0xFF8E24AA)),
                        ],
                      ),
                    );
                    if (picked != null) {
                      viewModel.onValueChange(
                        ItemField.color,
                        picked.name,
                        '',
                        executeUpdate: true,
                      );
                    }
                  },
                ),
                const SoftDivider(),
                if (item.type != ItemType.phone.name) ...[
                  EditableFieldTile(
                    icon: Icons.calendar_month_outlined,
                    label: 'Ano',
                    value: "${item.year}",
                    isLoading: state.yearUpdateLoad,
                    onEdit: () async {
                      final year =
                          await _pickYear(context, item.year.toString());
                      viewModel.onValueChange(
                        ItemField.year,
                        year.toString(),
                        '',
                        executeUpdate: true,
                      );
                    },
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
                  title: Text(
                    'Remover item?',
                    style: context.appText.headermd,
                  ),
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
                        context.pop();
                        viewModel.deleteProduct();
                        // showDeletingOverlay(context);
                      },
                      child: const Text('Remover'),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          Center(
              child: Text(
            "Caso exista um incidente relacionado ao ${item.name} a exclusão não poderá ser executada.",
            textAlign: TextAlign.center,
            style: context.appText.caption.copyWith(
              color: context.secondaryColor,
              fontWeight: FontWeight.w400,
            ),
          )),
        ],
      ),
    );
  }

  Future<int?> _pickYear(BuildContext context, String initial) async {
    final now = DateTime.now().year;
    int selected = int.tryParse(initial) ?? now;
    return showModalBottomSheet<int>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return YearBottomSheet(
          selectedYear: selected,
          min: 1950,
        );
      },
    );
  }

  void showDeletingOverlay(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.15), // leve escurecido
      builder: (_) {
        return PopScope(
          // onWillPop: () async => false, // bloqueia botão voltar
          canPop: false,
          child: Stack(
            children: [
              // Blur no fundo
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(color: Colors.transparent),
              ),

              // Card central
              Center(
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 280,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x22000000),
                          blurRadius: 24,
                          offset: Offset(0, 12),
                        ),
                      ],
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .outlineVariant
                            .withValues(alpha: 0.6),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 4),

                        // Loader + animação suave
                        SizedBox(
                          width: 44,
                          height: 44,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.2,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),

                        const SizedBox(height: 14),

                        Text(
                          message ?? "Excluindo item...",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "Aguarde um instante",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
