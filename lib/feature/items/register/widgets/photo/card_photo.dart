import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/badge/badge_text.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/feature/items/register/widgets/card_page.dart';
import 'package:deehelp/old_core/providers/image_picker_provider.dart';
import 'package:deehelp/old_core/services/image/default_image_picker.dart';
import 'package:deehelp/old_core/ui/extensions/dialog_extension.dart';
import 'package:deehelp/old_core/ui/extensions/result_extension.dart';
import 'package:deehelp/old_core/zoom_image_viewer.dart';
import 'package:deehelp/old_features/products/domain/entities/image_media.dart';
import 'package:deehelp/core/ui/widgets/grid/grid_add_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardPhoto extends ConsumerStatefulWidget {
  const CardPhoto({super.key});

  @override
  ConsumerState<CardPhoto> createState() => _CardPhotoState();
}

class _CardPhotoState extends ConsumerState<CardPhoto> {
  List<ImageMedia> photos = [];

  Future<void> pickFromGalley(DefaultImagePicker picker) async {
    try {
      final imageMedia = await picker.pickImageFromGallery();
      if (imageMedia.isFailure) {
        if (!mounted) return;
        context.showSnackBar(
          imageMedia.error.toString(),
          type: DialogType.error,
        );
      }
      setState(() => photos.add(imageMedia.data!));
    } catch (ex) {
      if (!mounted) return;
      context.showSnackBar(
        'Não foi possível abrir a galeria',
        type: DialogType.error,
      );
    }
  }

  Future<void> removePhoto(int index) async {
    final newImages = List<ImageMedia>.from(photos);
    if (index >= 0 && index < newImages.length) {
      photos.removeAt(index);
      setState(() {});
    }
  }

  Future<void> openPhotoViewer(int index) async {
    final urls = photos.map((e) => e.value).toList();
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) {
        return ImageZoomViewer(
          imageUrls: urls,
          initialIndex: index,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final imagePicker = ref.watch(imagePickerProvider);
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
                    style: context.appText.bodySmall.copyWith(
                      fontWeight: FontWeight.w900,
                      color: context.onSurface,
                    ),
                  ),
                ),
                const BadgeText(text: "3"),
              ],
            ),
            const SizedBox(height: SpacingSize.md),
            Text(
              'Item criado com ID: ${'INC101023'}',
              style: context.appText.caption.copyWith(
                fontWeight: FontWeight.w600,
                color: context.secondaryColor,
              ),
            ),
            const SizedBox(height: SpacingSize.md),
            GridAddPhoto(
              photos: photos,
              maxPhotos: 3,
              onAdd: () => pickFromGalley(imagePicker),
              onRemove: (position) => removePhoto(position),
              press: (position) => openPhotoViewer(position),
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
    );
  }
}
