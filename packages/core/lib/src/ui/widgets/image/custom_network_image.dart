import 'package:app_core/app_core.dart';
import 'package:app_core/src/theme/size/image_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final String? imageAlt;
  final double? height;
  final double? width;
  final double? radius;
  final BoxFit boxFit;
  final Color? color;
  final Widget? customErrorWidget;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.imageAlt,
    this.height,
    this.width,
    this.radius,
    this.boxFit = BoxFit.cover,
    this.customErrorWidget,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return _buildErrorWidget();
    }

    return _buildCachedImage();
  }

  Widget _buildCachedImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? RadiusSize.xs),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        color: color,
        imageBuilder: (context, imageProvider) => Container(
          height: height ?? ImageSize.md,
          width: width ?? ImageSize.md,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? RadiusSize.xs),
            image: DecorationImage(
              image: imageProvider,
              fit: boxFit,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
            ),
          ),
        ),
        placeholder: (context, url) => _buildPlaceholderWidget(),
        errorWidget: (context, url, error) => _buildErrorWidget(),
      ),
    );
  }

  Widget _buildPlaceholderWidget() {
    return Container(
      height: height ?? ImageSize.md,
      width: width ?? ImageSize.md,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusSize.xs),
        color: AppColors.grey.withValues(alpha: 0.2),
      ),
    );

    // );
  }

  Widget _buildErrorWidget() {
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        fit: boxFit,
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(RadiusSize.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusSize.xs),
            color: AppColors.grey.withValues(alpha: 0.3),
          ),
          child: customErrorWidget ??
              ClipRRect(
                borderRadius: BorderRadius.circular(RadiusSize.xs),
                child: Center(
                  child: Icon(
                    Icons.photo,
                    color: AppColors.grey.withValues(alpha: 0.9),
                    size: IconSizes.lg,
                  ),
                ),
              ),
        ),
        // child: isProfile
        //     ? (imageAlt != null && imageAlt!.isNotEmpty
        //         ? RandomColorAvatar(
        //             width: 40.w,
        //             height: 40.h,
        //             name: imageAlt!,
        //           )
        //         : ClipRRect(
        //             borderRadius: BorderRadius.circular(RadiusSize.xs),
        //             child: Center(
        //               child: Icon(
        //                 Icons.image,
        //                 color: AppColors.grey,
        //                 size: (height ?? 20) / 2,
        //               ),
        //             ),
        //           ))
        //     : Container(
        //         height: height,
        //         width: width,
        //         padding: const EdgeInsets.all(RadiusSize.md),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(RadiusSize.xs),
        //           color: AppColors.grey.withValues(alpha: 0.3),
        //         ),
        //         child: customErrorWidget ??
        //             ClipRRect(
        //               borderRadius: BorderRadius.circular(RadiusSize.xs),
        //               child: Center(
        //                 child: Icon(
        //                   Icons.photo,
        //                   color: AppColors.grey.withValues(alpha: 0.9),
        //                   size: IconSizes.lg,
        //                 ),
        //               ),
        //             ),
        //       ),
      ),
    );
  }
}
