import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentImage extends StatelessWidget {
  final List<ImageMedia> images;
  const IncidentImage({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusSize.lg.w),
        border: Border.all(
          color: context.outlineVariantColor,
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(RadiusSize.lg.w),
        child: CustomNetworkImage(
          imageUrl: images.isNotEmpty ? images.first.value : '',
          width: ImageSize.md,
          height: ImageSize.md,
        ),
      ),
    );
  }
}
