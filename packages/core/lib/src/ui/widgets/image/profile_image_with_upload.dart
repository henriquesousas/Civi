import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_core/src/theme/size/image_size.dart';
import 'package:app_core/src/ui/widgets/image/random_color.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileImageWithUploadButtonWidget extends StatefulWidget {
  final String? imageUrl;
  final String imageAlt;
  final bool showUploadIcon;
  final VoidCallback? onTap;
  final double? radius;
  final double? width;
  final double? height;
  final Function(File)? onChanged;

  const ProfileImageWithUploadButtonWidget({
    super.key,
    required this.imageAlt,
    this.imageUrl,
    this.showUploadIcon = false,
    this.onTap,
    this.onChanged,
    this.radius,
    this.width,
    this.height,
  });
  @override
  State<ProfileImageWithUploadButtonWidget> createState() =>
      _ProfileImageWithUploadButtonWidgetState();
}

class _ProfileImageWithUploadButtonWidgetState
    extends State<ProfileImageWithUploadButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ?? () {},
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              border: Border.all(
                color: context.primaryColor(),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(RadiusSize.xl),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RadiusSize.xl),
              ),
              child: widget.imageUrl == null
                  ? RandomColorAvatar(
                      width: ImageSize.md,
                      height: ImageSize.md,
                      name: widget.imageAlt,
                    )
                  : Skeleton.replace(
                      replace: true,
                      replacement: const Bone.circle(size: 80),
                      child: CustomNetworkImage(
                        imageUrl: widget.imageUrl!,
                        imageAlt: widget.imageAlt,
                        radius: widget.radius ?? RadiusSize.xl,
                        width: widget.width,
                        height: widget.height,
                        boxFit: BoxFit.cover,
                      ),
                    ),
            ),
            // if (widget.showUploadIcon)
            //   PositionedDirectional(
            //     bottom: 2,
            //     end: 2,
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: const Color(0XFFFFFFFF),
            //         borderRadius: BorderRadius.circular(20),
            //         boxShadow: const [
            //           BoxShadow(
            //             color: AppColors.primaryColor,
            //             blurRadius: 100,
            //             offset: Offset(-3, -8),
            //           ),
            //         ],
            //       ),
            //       width: widget.width / 2,
            //       height: widget.height / 2,
            //       padding: const EdgeInsetsDirectional.all(5),
            //       child: UIMyAssetsImageWidget(
            //         color: AppColors.primaryColor,
            //         isSvg: true,
            //         assetPath: R.svg.upload,
            //       ),
            //     ),
          ),
        ],
      ),
    );
  }
}
