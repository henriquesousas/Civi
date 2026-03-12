import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/badge/badge_text.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/feature/items/detail/widgets/card_text_zoom.dart';
import 'package:deehelp/feature/items/detail/widgets/empty_photos.dart';
import 'package:deehelp/feature/items/detail/widgets/horizontal_image_preview.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:flutter/material.dart';

class PhotosGalleryCard extends StatelessWidget {
  final List<ImageMedia> photos;
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;
  final PageController controller;
  final ValueChanged<int> onOpenZoom;

  const PhotosGalleryCard({
    super.key,
    required this.photos,
    required this.selectedIndex,
    required this.onIndexChanged,
    required this.controller,
    required this.onOpenZoom,
  });

  @override
  Widget build(BuildContext context) {
    final hasPhotos = photos.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Fotos do item',
                    style: context.appText.bodymd.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if (hasPhotos) ...[
                  BadgeText(text: '${selectedIndex + 1}/${photos.length}'),
                ],
              ],
            ),
            const SizedBox(height: SpacingSize.md),
            ClipRRect(
              borderRadius: BorderRadius.circular(RadiusSize.lg),
              child: AspectRatio(
                aspectRatio: 16 / 10,
                child: hasPhotos
                    ? Stack(
                        children: [
                          PageView.builder(
                            controller: controller,
                            itemCount: photos.length,
                            onPageChanged: onIndexChanged,
                            itemBuilder: (_, i) {
                              return GestureDetector(
                                onTap: () => onOpenZoom(i),
                                child: CustomNetworkImage(
                                    imageUrl: photos[i].value),
                                // child: Container(
                                //   color: const Color(0xFFF5F7FD),
                                //   child: Image(
                                //     image: photos[i],
                                //     fit: BoxFit.cover,
                                //   ),
                                // ),
                              );
                            },
                          ),
                          const Positioned(
                            right: 10,
                            bottom: 10,
                            child: CardTextZoom(),
                          ),
                        ],
                      )
                    : const EmptyPhotos(),
              ),
            ),
            if (hasPhotos) ...[
              const SizedBox(height: SpacingSize.md),
              HorizontalImagePreview(
                photos: photos,
                selectedIndex: selectedIndex,
                press: (i) {
                  controller.animateToPage(
                    i,
                    duration: const Duration(milliseconds: 260),
                    curve: Curves.easeOut,
                  );
                  onIndexChanged(i);
                },
              ),
              // TextButton(onPressed: () {}, child: const Text("Atualizar fotos"))
            ],
          ],
        ),
      ),
    );
  }
}
