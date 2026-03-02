import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:flutter/material.dart';

class HorizontalPhotos extends StatelessWidget {
  final List<ImageMedia> photos;
  final void Function(int index) onTap;

  const HorizontalPhotos(
      {super.key, required this.photos, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ImageSize.md,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final url = photos[i];
          return InkWell(
            borderRadius: BorderRadius.circular(RadiusSize.md),
            onTap: () => onTap(i),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(RadiusSize.md),
              child: AspectRatio(
                aspectRatio: 1.2,
                child: CustomNetworkImage(
                  imageUrl: url.value,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
