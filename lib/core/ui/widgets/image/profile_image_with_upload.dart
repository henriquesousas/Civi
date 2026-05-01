import 'dart:io';

import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';

import 'export_image.dart';
import 'random_color.dart';
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
  final bool showBorder;

  const ProfileImageWithUploadButtonWidget({
    super.key,
    required this.imageAlt,
    this.imageUrl,
    this.showUploadIcon = false,
    this.showBorder = false,
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
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: widget.showBorder
            //         ? context.primaryColor
            //         : context.primaryColor,
            //     width: 1,
            //   ),
            //   borderRadius: BorderRadius.circular(RadiusSize.xxl),
            // ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RadiusSize.xxl),
              ),
              child: widget.imageUrl == null
                  ? RandomColorAvatar(
                      width: ImageSize.xs,
                      height: ImageSize.xs,
                      name: widget.imageAlt,
                    )
                  : Skeleton.replace(
                      replace: true,
                      replacement: const Bone.circle(size: 80),
                      child: CustomNetworkImage(
                        imageUrl: widget.imageUrl!,
                        imageAlt: widget.imageAlt,
                        radius: widget.radius ?? RadiusSize.xxl,
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
