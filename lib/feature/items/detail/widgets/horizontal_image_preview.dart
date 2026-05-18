import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:flutter/material.dart';

class HorizontalImagePreview extends StatelessWidget {
  final List<ImageMedia> photos;
  final Function(int) press;
  final int selectedIndex;
  const HorizontalImagePreview(
      {super.key,
      required this.photos,
      required this.press,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.isLandscape
          ? context.percentHeight(0.2)
          : context.percentHeight(0.07),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: SpacingSize.md,
          width: 4,
        ),
        itemBuilder: (_, i) {
          final selected = i == selectedIndex;
          return GestureDetector(
            onTap: () => press(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: selected
                    ? context.primaryColor.withValues(alpha: 0.18)
                    : context.surfaceColor,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color:
                      selected ? context.primaryColor : const Color(0xFFE6EAF6),
                  width: selected ? 1.6 : 1,
                ),
              ),
              child: CustomNetworkImage(
                width: ImageSize.sm,
                radius: RadiusSize.md,
                imageUrl: photos[i].value,
                boxFit: BoxFit.cover,
              ),
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(RadiusSize.md),
              //   child: AspectRatio(
              //     aspectRatio: 1,
              //     child: Image(image: photos[i].value, fit: BoxFit.cover),
              //   ),
              // ),
            ),
          );
        },
      ),
    );
  }
}
