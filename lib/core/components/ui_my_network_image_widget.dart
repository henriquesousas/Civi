import 'package:cached_network_image/cached_network_image.dart';
import 'package:deehelp/core/components/random_color_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UIMyNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final String? imageAlt;
  final double? height;
  final double? width;
  final double radius;
  final BoxFit boxFit;
  final bool isProfile;
  final Color? color;
  final bool isSvg;
  final Widget? customErrorWidget;

  const UIMyNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.imageAlt,
    this.height = 80,
    this.width = 100,
    this.radius = 5,
    this.boxFit = BoxFit.cover,
    this.isProfile = false,
    this.customErrorWidget,
    this.isSvg = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return _buildErrorWidget();
    }

    return isSvg ? _buildSvgImage() : _buildCachedImage();
  }

  Widget _buildSvgImage() {
    return SvgPicture.network(
      imageUrl,
      height: height,
      width: width,
      fit: boxFit,
      placeholderBuilder: (context) => _buildPlaceholderWidget(),
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }

  Widget _buildCachedImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      color: color,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
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
    );
  }

  Widget _buildPlaceholderWidget() {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Center(
          // child: SpinKitFadingCube(
          //   color: MyColor.getPrimaryColor().withValues(alpha: 0.3),
          //   size: 20,
          // ),
          child: CircularProgressIndicator(
            color: Color(
                0xFF2B5BEE), // MyColor.getPrimaryColor().withValues(alpha: 0.3),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        fit: boxFit,
        child: isProfile
            ? (imageAlt != null && imageAlt!.isNotEmpty
                ? const RandomColorAvatar(
                    width: 40,
                    height: 40,
                    name: "j",
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(radius),
                    child: Center(
                      child: Skeleton.replace(
                        replace: true,
                        replacement: Bone.circle(size: (height ?? 20) / 2),
                        child: Icon(
                          Icons.image,
                          color: const Color(
                              0xFF475569), //MyColor.getBodyTextColor(),
                          size: (height ?? 20) / 2,
                        ),
                      ),
                    ),
                  ))
            : customErrorWidget ??
                ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: Center(
                    child: Skeleton.replace(
                      replace: true,
                      replacement: Bone.circle(size: (height ?? 20) / 2),
                      child: Icon(
                        Icons.image,
                        color: Color(0xFF475569), //MyColor.getBodyTextColor(),
                        size: (height ?? 20) / 2,
                      ),
                    ),
                  ),
                ),
      ),
    );
  }
}
