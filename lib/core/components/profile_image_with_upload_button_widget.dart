import 'dart:io';

import 'package:deehelp/core/components/dimens_test.dart';
import 'package:deehelp/core/components/ui_my_assets_image_widget.dart';
import 'package:deehelp/core/components/ui_my_network_image_widget.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../ui/assets/resources.dart';

//TODO: Renomear por que vai ser reutilizavel em varios locais
class ProfileImageWithUploadButtonWidget extends StatefulWidget {
  final String imageUrl;
  final String imageAlt;
  final bool showUploadIcon;
  final VoidCallback? onTap;
  final double radius;
  final double width;
  final double height;
  final Function(File)? onChanged;

  const ProfileImageWithUploadButtonWidget({
    super.key,
    required this.imageUrl,
    this.showUploadIcon = true,
    this.onTap,
    this.onChanged,
    this.radius = Dimens.defaultRadius,
    this.width = 80,
    this.height = 80,
    required this.imageAlt,
  });
  @override
  State<ProfileImageWithUploadButtonWidget> createState() =>
      _ProfileImageWithUploadButtonWidgetState();
}

class _ProfileImageWithUploadButtonWidgetState
    extends State<ProfileImageWithUploadButtonWidget> {
  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryColor.withValues(alpha: 0.15),
                width: DimensTest.space4,
              ),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(widget.radius),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primaryColor.withValues(alpha: 0.15),
                    width: DimensTest.space3,
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimens.defaultRadius,
                  ),
                ),
                child: _imageFile == null
                    ? Skeleton.replace(
                        replace: true,
                        replacement: const Bone.circle(size: 80),
                        child: UIMyNetworkImageWidget(
                          imageUrl: widget.imageUrl,
                          isProfile: true,
                          imageAlt: widget.imageAlt,
                          radius: widget.radius,
                          width: widget.width,
                          height: widget.height,
                          boxFit: BoxFit.cover,
                        ),
                      )
                    : UIMyAssetsImageWidget(
                        assetPath: _imageFile?.path ?? '',
                        isFile: true,
                        radius: widget.radius,
                        boxFit: BoxFit.cover,
                        width: widget.width,
                        height: widget.height,
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
                  borderRadius: BorderRadius.circular(DimensTest.radiusMax),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.primaryColor,
                      blurRadius: 100,
                      offset: Offset(-3, -8),
                    ),
                  ],
                ),
                width: widget.width / 2,
                height: widget.height / 2,
                padding: const EdgeInsetsDirectional.all(5),
                child: UIMyAssetsImageWidget(
                  color: AppColors.primaryColor,
                  isSvg: true,
                  assetPath: R.images.svgUploadIcon,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
