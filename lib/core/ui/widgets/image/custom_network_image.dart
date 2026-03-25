import 'package:cached_network_image/cached_network_image.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imageUrl;
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
    if (imageUrl == null || imageUrl!.isEmpty) {
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
        imageUrl: imageUrl!,
        color: color,
        imageBuilder: (context, imageProvider) => Container(
          height: height ?? ImageSize.xs,
          width: width ?? ImageSize.xs,
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
    // return Container(
    //   height: height ?? ImageSize.xs,
    //   width: width ?? ImageSize.xs,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(RadiusSize.xs),
    //     color: AppColors.grey.withValues(alpha: 0.2),
    //   ),
    // );
    return ImageShimmer(
      height: height ?? ImageSize.xs,
      width: width ?? ImageSize.xs,
      radius: radius ?? RadiusSize.xs,
    );

    // );
  }

  Widget _buildErrorWidget() {
    return ImageErrorWidget(
      height: height ?? ImageSize.xs,
      width: width ?? ImageSize.xs,
      radius: radius ?? RadiusSize.xs,
    );
    // return SizedBox(
    //   height: height,
    //   width: width,
    //   child: FittedBox(
    //     fit: boxFit,
    //     child: Container(
    //       height: height,
    //       width: width,
    //       padding: const EdgeInsets.all(RadiusSize.md),
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(RadiusSize.md),
    //         color: AppColors.grey.withValues(alpha: 0.09),
    //       ),
    //       child: customErrorWidget ??
    //           ClipRRect(
    //             borderRadius: BorderRadius.circular(RadiusSize.xs),
    //             child: Center(
    //               child: Icon(
    //                 Icons.image_not_supported,
    //                 color: AppColors.grey.withValues(alpha: 0.5),
    //                 size: IconSizes.lg,
    //               ),
    //             ),
    //           ),
    //     ),
    //     // child: isProfile
    //     //     ? (imageAlt != null && imageAlt!.isNotEmpty
    //     //         ? RandomColorAvatar(
    //     //             width: 40.w,
    //     //             height: 40.h,
    //     //             name: imageAlt!,
    //     //           )
    //     //         : ClipRRect(
    //     //             borderRadius: BorderRadius.circular(RadiusSize.xs),
    //     //             child: Center(
    //     //               child: Icon(
    //     //                 Icons.image,
    //     //                 color: AppColors.grey,
    //     //                 size: (height ?? 20) / 2,
    //     //               ),
    //     //             ),
    //     //           ))
    //     //     : Container(
    //     //         height: height,
    //     //         width: width,
    //     //         padding: const EdgeInsets.all(RadiusSize.md),
    //     //         decoration: BoxDecoration(
    //     //           borderRadius: BorderRadius.circular(RadiusSize.xs),
    //     //           color: AppColors.grey.withValues(alpha: 0.3),
    //     //         ),
    //     //         child: customErrorWidget ??
    //     //             ClipRRect(
    //     //               borderRadius: BorderRadius.circular(RadiusSize.xs),
    //     //               child: Center(
    //     //                 child: Icon(
    //     //                   Icons.photo,
    //     //                   color: AppColors.grey.withValues(alpha: 0.9),
    //     //                   size: IconSizes.lg,
    //     //                 ),
    //     //               ),
    //     //             ),
    //     //       ),
    //   ),
    // );
  }
}

class ImageShimmer extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  const ImageShimmer({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
}

class ImageErrorWidget extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final IconData icon;

  const ImageErrorWidget({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
    this.icon = Icons.image_not_supported,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.grey.withValues(alpha: 0.08),
      ),
      child: Icon(
        CupertinoIcons.photo,
        color: Colors.grey,
        size: 25.w,
      ),
      // child: Center(
      //   child: Image.asset(
      //     "assets/images/logo_white.png",
      //     width: 55.w,
      //     height: 55.h,
      //   ),
      // ),
    );
  }
}
