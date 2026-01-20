// ignore_for_file: use_build_context_synchronously

import 'package:deehelp/core/ui/extensions/dialog_extension.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/core/ui/extensions/result_extension.dart';
import 'package:deehelp/core/providers/image_picker_provider.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/add/widget/header_text_card.dart';
import 'package:deehelp/features/products/presentation/views/add/widget/grid_add_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepAddPhoto extends ConsumerStatefulWidget {
  const StepAddPhoto({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StepAddPhotoState();
}

class _StepAddPhotoState extends ConsumerState<StepAddPhoto> {
  @override
  Widget build(BuildContext context) {
    final imagePicker = ref.watch(imagePickerProvider);
    final state = ref.watch(addProductViewModelProvider);
    final viewModel = ref.watch(addProductViewModelProvider.notifier);
    return UICustomAppCard(
      child: Column(
        children: [
          const HeaderTextCard(
            header: "Foto detalhada",
            text:
                "Adicione fotos do seu veículo para facilitar a identificação e tornar seu registro mais completo.",
          ),
          const SizedBox(height: 10),
          GridAddPhoto(
            maxPhotos: 2,
            photos: state.imageMedia,
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
            onRemove: (index) => viewModel.removePhoto(index),
          )
        ],
      ),
    );
  }
}
