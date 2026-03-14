import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/badge/badge_text.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/feature/items/detail/widgets/card_text_zoom.dart';
import 'package:deehelp/feature/items/detail/widgets/empty_photos.dart';
import 'package:deehelp/feature/items/detail/widgets/horizontal_image_preview.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:flutter/cupertino.dart';
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
      // decoration: BoxDecoration(
      //   color: context.surfaceColor,
      //   borderRadius: BorderRadius.circular(24),
      //   boxShadow: const [
      //     BoxShadow(
      //       color: Color(0x142B5BEE),
      //       blurRadius: 16,
      //       offset: Offset(0, 8),
      //     ),
      //   ],
      // ),
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

class PhotosGalleryCardV2 extends StatelessWidget {
  final List<ImageMedia> photos;
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;
  final PageController controller;
  final ValueChanged<int> onOpenZoom;

  const PhotosGalleryCardV2({
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

    if (!hasPhotos) {
      return Container(
        color: const Color(0xFF111214),
        child: const Center(
          child: Icon(
            CupertinoIcons.photo,
            color: Colors.white38,
            size: 46,
          ),
        ),
      );
    }

    return Stack(
      children: [
        PageView.builder(
          controller: controller,
          itemCount: photos.length,
          onPageChanged: onIndexChanged,
          itemBuilder: (_, i) {
            return GestureDetector(
              onTap: () => onOpenZoom(i),
              child: CustomNetworkImage(imageUrl: photos[i].value),
            );
          },
          // itemBuilder: (_, i) {
          //   return GestureDetector(
          //     onTap: () => onOpenZoom(i),
          //     child: Image(
          //       image: photos[i],
          //       fit: BoxFit.cover,
          //       width: double.infinity,
          //       height: double.infinity,
          //     ),
          //   );
          // },
        ),
        Positioned(
          right: 16,
          bottom: 68,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.50),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white12),
            ),
            child: const Row(
              children: [
                Icon(
                  CupertinoIcons.zoom_in,
                  size: 14,
                  color: Colors.white,
                ),
                SizedBox(width: 6),
                Text(
                  'Ampliar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 18,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 64,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: photos.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (_, i) {
                      final selected = i == selectedIndex;
                      return GestureDetector(
                        onTap: () {
                          controller.animateToPage(
                            i,
                            duration: const Duration(milliseconds: 260),
                            curve: Curves.easeOut,
                          );
                          onIndexChanged(i);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: selected
                                ? const Color(0x338F98FF)
                                : const Color(0x33121214),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: selected
                                  ? const Color(0xFF8F98FF)
                                  : Colors.white10,
                              width: selected ? 1.5 : 1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: CustomNetworkImage(
                                imageUrl: photos[i].value,

                                // image: photos[i],
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white10),
                ),
                child: Text(
                  '${selectedIndex + 1}/${photos.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
