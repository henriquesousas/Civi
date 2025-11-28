import 'dart:io';

import 'package:deehelp/core/components/dimens_test.dart';
import 'package:deehelp/core/components/ui_my_assets_image_widget.dart';
import 'package:deehelp/core/components/ui_my_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../resources/resources.dart';

class ProfileImageWithUploadButtonWidget extends StatefulWidget {
  const ProfileImageWithUploadButtonWidget({
    super.key,
    required this.imageUrl,
    this.showUploadIcon = true,
    this.onTap,
    this.onChanged,
    required this.imageAlt,
  });
  final String imageUrl;
  final String imageAlt;
  final bool showUploadIcon;
  final VoidCallback? onTap;
  final Function(File)? onChanged;

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
                color: const Color(0xFF2B5BEE).withValues(
                    alpha:
                        0.15), //MyColor.getPrimaryColor().withValues(alpha: 0.15),
                width: DimensTest.space4,
              ),
              borderRadius: BorderRadius.circular(DimensTest.radiusProMax),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF2B5BEE),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(DimensTest.radiusProMax),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF2B5BEE).withValues(alpha: 0.15),
                    width: DimensTest.space3,
                  ),
                  borderRadius: BorderRadius.circular(
                    DimensTest.radiusProMax,
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
                          radius: DimensTest.radiusMax,
                          width: 80,
                          height: 80,
                          boxFit: BoxFit.cover,
                        ),
                      )
                    : UIMyAssetsImageWidget(
                        assetPath: _imageFile?.path ?? '',
                        isFile: true,
                        radius: DimensTest.radiusMax,
                        boxFit: BoxFit.cover,
                        width: 80,
                        height: 80,
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
                  color: const Color(0XFFFFFFFF), // or any background
                  borderRadius: BorderRadius.circular(DimensTest.radiusMax),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(
                          0xFF2B5BEE), // MyColor.getPrimaryColor().withValues(alpha: 0.3),
                      blurRadius: 5,
                      offset: Offset(-3, -8),
                    ),
                  ],
                ),
                width: 30,
                height: 30,
                padding: EdgeInsetsDirectional.all(5),
                child: UIMyAssetsImageWidget(
                  color: Color(0xFF2B5BEE),
                  isSvg: true,
                  assetPath: R.images.svgUploadIcon,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
