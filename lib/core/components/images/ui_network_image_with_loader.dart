import 'package:cached_network_image/cached_network_image.dart';
import 'package:deehelp/core/components/images/ui_image_place_holder_widget.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/constants.dart';
import 'package:flutter/material.dart';

class UINetworkImageWithLoader extends StatelessWidget {
  final BoxFit fit;
  final String src;
  final double radius;
  final double? width;
  final double? height;

  const UINetworkImageWithLoader({
    super.key,
    this.fit = BoxFit.cover,
    this.radius = defaultBorderRadius,
    this.width = 60,
    this.height = 60,
    required this.src,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: CachedNetworkImage(
          width: width,
          height: height,
          fit: fit,
          imageUrl: src,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Container(
            color: Colors.grey[200],
            child: Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                strokeWidth: 2,
                color: Colors.grey[400],
              ),
            ),
          ),
          errorWidget: (context, url, error) =>
              const UIImagePlaceHolderWidget(),
        ),
      ),
    );
  }
}
