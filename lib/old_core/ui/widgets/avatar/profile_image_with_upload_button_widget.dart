import 'dart:io';

import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/widgets/image/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileImageWithUploadButtonWidget extends StatefulWidget {
  final String imageUrl;
  final String imageAlt;
  final bool showUploadIcon;
  final VoidCallback? onTap;
  final double? radius;
  final double width;
  final double height;
  final Function(File)? onChanged;
  final BoxBorder? border;
  final bool showBoxShadow;

  const ProfileImageWithUploadButtonWidget({
    super.key,
    required this.imageUrl,
    this.showUploadIcon = true,
    this.onTap,
    this.onChanged,
    this.radius,
    this.width = 80,
    this.height = 80,
    this.showBoxShadow = false,
    this.border,
    required this.imageAlt,
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
            decoration: BoxDecoration(
              border: Border.all(
                color: context.primaryColor.withValues(alpha: 0.15),
                width: 2.w,
              ),
              borderRadius: BorderRadius.circular(
                widget.radius ?? RadiusSize.md,
              ),
              boxShadow: widget.showBoxShadow
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      )
                    ]
                  : null,
            ),
            child: Container(
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: AppColors.primaryColor,
                //   width: 2,
                // ),
                border: widget.border,
                borderRadius:
                    BorderRadius.circular(widget.radius ?? RadiusSize.md),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(RadiusSize.md),
                ),
                child: widget.imageUrl.isNotEmpty
                    ? Skeleton.replace(
                        replace: true,
                        replacement: const Bone.circle(size: 80),
                        child: CustomNetworkImage(
                          imageUrl: widget.imageUrl,
                          // isProfile: true,
                          imageAlt: widget.imageAlt,
                          radius: widget.radius,
                          width: widget.width,
                          height: widget.height,
                          boxFit: BoxFit.cover,
                        ),
                      )
                    : CustomNetworkImage(
                        // assetPath: widget.imageUrl,
                        // isFile: true,
                        radius: widget.radius,
                        boxFit: BoxFit.cover,
                        width: widget.width,
                        height: widget.height, imageUrl: widget.imageUrl,
                      ),
              ),
            ),
          ),
          if (widget.showUploadIcon)
            PositionedDirectional(
              bottom: 2,
              end: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: context.primaryColor,
                      blurRadius: 100,
                      offset: const Offset(-3, -8),
                    ),
                  ],
                ),
                width: widget.width / 2,
                height: widget.height / 2,
                padding: const EdgeInsetsDirectional.all(5),
                // child: UIMyAssetsImageWidget(
                //   color: AppColors.primaryColor,
                //   isSvg: true,
                //   assetPath: R.svg.upload,
                // ),
              ),
            ),
        ],
      ),
    );
  }
}
