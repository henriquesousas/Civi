import 'package:cached_network_image/cached_network_image.dart';
import 'package:deehelp/v2/core/theme/app_colors.dart';
import 'package:deehelp/v2/core/theme/size_circular_progress_indicator.dart';
import 'package:deehelp/v2/core/theme/size_spacing.dart';
import 'package:deehelp/v2/core/widgets/image/aspect_ration.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final AspectRatioType aspectRatio;
  final BoxFit fit;
  final String? fallbackAsset;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.fallbackAsset,
    this.aspectRatio = AspectRatioType.video,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio.value,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: double.infinity,
        fit: fit,

        /// 🔄 Loading
        placeholder: (context, url) => Container(
          color: const Color(0xFF1B1B1B),
          alignment: Alignment.center,
          child: const SizedBox(
            width: SizeCircularProgressIndicator.m,
            height: SizeCircularProgressIndicator.m,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),

        /// ❌ Erro
        errorWidget: (context, url, error) {
          if (fallbackAsset != null) {
            return Image.asset(
              fallbackAsset!,
              fit: fit,
            );
          }

          return Container(
            color: context.appColor.primaryBgColor,
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_not_supported_outlined,
              color: Colors.white54,
              size: SizeSpacing.xxl,
            ),
          );
        },
      ),
    );
  }
}
