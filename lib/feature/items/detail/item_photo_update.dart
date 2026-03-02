import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/services/image/image_picker_failure.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/badge/badge_text.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/core/ui/widgets/image/grid_add_image.dart';
import 'package:deehelp/feature/items/detail/provider/item_update_viewmodel_provider.dart';
import 'package:deehelp/feature/items/detail/provider/selected_item_provider.dart';
import 'package:deehelp/feature/items/detail/viewmodel/product_update_state.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/section_title.dart';
import 'package:deehelp/core/providers/image_picker_provider.dart';
import 'package:deehelp/core/extension/dialog_extension.dart';
import 'package:deehelp/core/extension/result_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ItemPhotoUpdate extends ConsumerStatefulWidget {
  const ItemPhotoUpdate({super.key});

  @override
  ConsumerState<ItemPhotoUpdate> createState() => _ItemPhotoUpdateState();
}

class _ItemPhotoUpdateState extends ConsumerState<ItemPhotoUpdate> {
  @override
  Widget build(BuildContext context) {
    final imagePicker = ref.watch(imagePickerProvider);
    final selectedItem = ref.watch(selectedItemProvider.notifier);
    final provider = itemUpdateViewmodelProvider(selectedItem.state!.id.value);
    final state = ref.watch(provider);
    final viewModel = ref.watch(provider.notifier);

    ref.listen<ProductUpdateState>(
      provider,
      (oldState, currentState) {
        if (currentState.errorUploadOrDeleteImage != null) {
          context.showSnackBar(
            'Desculpe tivemos um problema, tente novamente mais tarde!!!',
            type: DialogType.error,
          );
        }
      },
    );

    return Scaffold(
      appBar: DefaultAppBar(
        title: "Alterar fotos",
        press: () => context.pop(),
        showBackButton: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(LayoutSpacingSize.card),
        children: [
          const SectionTitle('Fotos do item'),
          PageCard(
            child: Padding(
              padding: const EdgeInsets.all(LayoutSpacingSize.card),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      HighlightIcon(
                        icon: Icon(
                          Icons.photo_library_outlined,
                          color: context.primaryColor,
                        ),
                      ),
                      const SizedBox(width: SpacingSize.md),
                      Expanded(
                        child: Text(
                          'Adicione fotos do item',
                          style: context.appText.bodySmall.copyWith(
                            fontWeight: FontWeight.w900,
                            color: context.onSurface,
                          ),
                        ),
                      ),
                      BadgeText(
                        text:
                            selectedItem.state?.images.length.toString() ?? '',
                      ),
                    ],
                  ),
                  const SizedBox(height: SpacingSize.md),
                  GridAddImage(
                    photos: selectedItem.state?.images ?? [],
                    maxPhotos: 3,
                    // loadingIndex: 2,
                    isAddLoading: state.addingPhoto,
                    blockWhileLoading: state.addingPhoto,
                    loadingIndex: state.removeImageIndex,
                    onAdd: () async {
                      try {
                        final imageMedia =
                            await imagePicker.pickImageFromGallery();

                        if (imageMedia.isFailure) {
                          if (!context.mounted) return;
                          final imagePickerError =
                              (imageMedia.error as ImagePickerFailure);

                          if (imagePickerError.canceled) return;
                          context.showTopNotice(
                            imageMedia.error.toString(),
                            type: DialogType.error,
                          );
                        }
                        // setState(() => photos.add(imageMedia.data!));
                        viewModel.addPhoto(imageMedia.data!);
                      } catch (ex) {
                        debugPrint(ex.toString());
                      }
                    },
                    onRemove: (index) => viewModel.deletePhoto(index),
                  ),
                  const SizedBox(height: SpacingSize.lg),
                  Text(
                    'Dica: fotos nítidas ajudam a agilizar a verificação.',
                    style: context.appText.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _grid(
  //   BuildContext context,
  //   List<ImageMedia> images,
  //   DefaultImagePicker imagePicker,
  //   ItemUpdateViewmodel viewModel, {
  //   bool loading = false,
  // }) {
  //   return GridAddImage(
  //     photos: images,
  //     maxPhotos: 3,
  //      loadingIndex: state.deletingIndex,
  //     onAdd: () async {
  //       try {
  //         final imageMedia = await imagePicker.pickImageFromGallery();
  //         if (imageMedia.isFailure) {
  //           if (!context.mounted) return;
  //           context.showSnackBar(
  //             imageMedia.error.toString(),
  //             type: DialogType.error,
  //           );
  //         }
  //         // setState(() => photos.add(imageMedia.data!));
  //         viewModel.addPhoto(imageMedia.data!);
  //       } catch (ex) {
  //         debugPrint(ex.toString());
  //       }
  //     },
  //     onRemove: (index) => viewModel.deletePhoto(index),
  //   );
  // }
}
