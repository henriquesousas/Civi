import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/badge/badge_text.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_assets_image_widget.dart';
import 'package:deehelp/feature/items/detail/widgets/card_text_zoom.dart';
import 'package:deehelp/feature/items/detail/widgets/empty_photos.dart';
import 'package:deehelp/feature/items/detail/widgets/horizontal_image_preview.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Fotos do item',
                  style: context.appTextOld.bodymd.copyWith(
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
                              child:
                                  CustomNetworkImage(imageUrl: photos[i].value),
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
    );
  }
}

class PhotosGalleryCardV2 extends StatelessWidget {
  final List<ImageMedia> photos;
  final String itemtype;
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
    required this.itemtype,
  });

  @override
  Widget build(BuildContext context) {
    final hasPhotos = photos.isNotEmpty;

    if (!hasPhotos) {
      return Container(
        // color: const Color(0xFF111214),
        color: context.primaryBgCard,
        child: Center(
          child: itemtype == ItemType.phone.name
              ? CiviImageCard(
                  assetPath: "assets/images/phone_pin_v2.png",
                  width: 70.w,
                  height: 70.h,
                )
              : Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                    // color: context.primaryBgCardLow,
                    color: context.primaryBgCardHigh,
                    // color: Colors.black.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: context.primaryBgCard,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Icon(
                    Icons.image_not_supported,
                    // color: context.isDark() ? Colors.white : context.primaryBgCard,
                    color: context.primaryTextColor.withValues(alpha: 0.5),
                    size: 40.w,
                  ),
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
