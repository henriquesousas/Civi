// ignore_for_file: use_build_context_synchronously

import 'package:deehelp/core/extensions/dialog_extension.dart';
import 'package:deehelp/core/extensions/result_extension.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/products/presentation/providers/image_picker_provider.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/add/widget/grid_add_photo.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/item_detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoSection extends ConsumerStatefulWidget {
  const PhotoSection({super.key});

  @override
  ConsumerState<PhotoSection> createState() => _PhotoSectionState();
}

class _PhotoSectionState extends ConsumerState<PhotoSection> {
  @override
  Widget build(BuildContext context) {
    final imagePicker = ref.watch(imagePickerProvider);
    final viewModel = ref.watch(updateProductViewModelProvider.notifier);
    final state = ref.watch(updateProductViewModelProvider);

    return UICustomAppCard(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 3,
        children: [
          ItemDetailTile(
            title: "Fotos",
            subtitle: "${state.currentProduct!.images.length} Foto(s)",
            showDivider: false,
            showIconEdit: false,
            press: () async {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridAddPhoto(
              isLoading: state.addingPhoto,
              photos: state.currentProduct!.images,
              onAdd: () async {
                final imageMedia = await imagePicker.pickImageFromGallery();
                if (imageMedia.isFailure) {
                  context.showSnackBar(
                    imageMedia.error.toString(),
                    type: DialogType.error,
                  );
                  return;
                }
                if (!mounted) return;
                viewModel.addPhoto(imageMedia.data!);
              },
              onRemove: (index) async {
                final yes = await context.showQuestionDialog(
                  "Remover",
                  "Deletar imagem ?",
                );

                if (yes) {
                  viewModel.deletePhoto(index);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
