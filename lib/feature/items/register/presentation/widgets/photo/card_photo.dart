import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/app_text_style.dart';
import 'package:deehelp/old_core/ui/widgets/badge/badge_text.dart';
import 'package:deehelp/old_core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/old_core/ui/widgets/image/image_view_dialog.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:deehelp/feature/items/register/viewmodel/register_item_viewmodel.dart';
import 'package:deehelp/module/item/di/item_viewmodel_provider.dart';
import 'package:deehelp/old_core/providers/image_picker_provider.dart';
import 'package:deehelp/old_core/services/image/default_image_picker.dart';
import 'package:deehelp/old_core/services/image/image_picker_failure.dart';
import 'package:deehelp/old_core/extension/dialog_extension.dart';
import 'package:deehelp/old_core/extension/result_extension.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/old_core/ui/widgets/image/grid_add_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardPhoto extends ConsumerStatefulWidget {
  final int allowedPhotos;
  const CardPhoto({
    super.key,
    required this.allowedPhotos,
  });

  @override
  ConsumerState<CardPhoto> createState() => _CardPhotoState();
}

class _CardPhotoState extends ConsumerState<CardPhoto> {
  List<ImageMedia> photos = [];

  Future<void> pickFromGalley(
    DefaultImagePicker picker,
    RegisterItemViewmodel viewModel,
  ) async {
    try {
      final imageMedia = await picker.pickImageFromGallery();
      if (imageMedia.isFailure) {
        if (!mounted) return;
        final imagePickerError = (imageMedia.error as ImagePickerFailure);

        if (imagePickerError.canceled) return;

        context.showSnackBar(
          imagePickerError.message,
          type: DialogType.error,
        );
        return;
      }
      // setState(() => photos.add(imageMedia.data!));
      viewModel.addPhoto(imageMedia.data!);
    } catch (ex) {
      if (!mounted) return;
      context.showSnackBar(
        'Não foi possível abrir a galeria',
        type: DialogType.error,
      );
    }
  }

  Future<void> removePhoto(int index, RegisterItemViewmodel viewModel) async {
    viewModel.removePhoto(index);
  }

  Future<void> openPhotoViewer(int index) async {
    await showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.92),
      builder: (_) => ImageViewDialog(
        photos: photos,
        initialIndex: index,
      ),
    );
    // final urls = photos.map((e) => e.value).toList();
    // showDialog(
    //   context: context,
    //   barrierColor: Colors.black87,
    //   builder: (context) {
    //     return ImageZoomViewer(
    //       imageUrls: urls,
    //       initialIndex: index,
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    final imagePicker = ref.watch(imagePickerProvider);
    final state = ref.watch(registerItemViewModelProvider);
    final viewModel = ref.watch(registerItemViewModelProvider.notifier);
    return PageCard(
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
                    style: context.appTextOld.bodySmall.copyWith(
                      fontWeight: FontWeight.w900,
                      color: context.onSurface,
                    ),
                  ),
                ),
                BadgeText(text: state.imageMedia.length.toString()),
              ],
            ),
            const SizedBox(height: SpacingSize.md),
            GridAddImage(
              photos: state.imageMedia,
              maxPhotos: widget.allowedPhotos,
              onAdd: () => pickFromGalley(imagePicker, viewModel),
              onRemove: (index) => removePhoto(index, viewModel),
            ),
            const SizedBox(height: SpacingSize.lg),
            Text(
              'Dica: fotos nítidas ajudam a agilizar a verificação.',
              style: context.appTextOld.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
