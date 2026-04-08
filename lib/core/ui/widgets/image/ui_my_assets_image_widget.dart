import 'dart:io';

import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UIMyAssetsImageWidget extends StatelessWidget {
  final String assetPath;
  final double? height;
  final double? width;
  final double radius;
  final BoxFit boxFit;
  final bool isSvg;
  final bool isFile;
  final Color? color;
  const UIMyAssetsImageWidget({
    super.key,
    required this.assetPath,
    this.height = 80,
    this.width = 100,
    this.radius = 5,
    this.boxFit = BoxFit.fitHeight,
    this.isSvg = false,
    this.isFile = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        // color: color?.withValues(alpha:0.2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: isSvg
            ? _buildSvgImage()
            : isFile
                ? _buildFileImage()
                : _buildAssetImage(),
      ),
    );
  }

  Widget _buildSvgImage() {
    return SvgPicture.asset(
      assetPath,
      height: height,
      width: width,
      fit: boxFit,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null, // Apply color filter if color is provided
    );
  }

  Widget _buildFileImage() {
    return Image.file(
      File(assetPath),
      height: height,
      width: width,
      fit: boxFit,
      color: color,
      colorBlendMode: color != null ? BlendMode.srcIn : null,
    );
  }

  Widget _buildAssetImage() {
    return Image.asset(
      assetPath,
      height: height,
      width: width,
      fit: boxFit,
      color: color,
      colorBlendMode: color != null ? BlendMode.srcIn : null,
    );
  }
}

class CiviImageCard extends StatelessWidget {
  final double width;
  final double height;
  final String assetPath;
  final Color? color;

  const CiviImageCard({
    super.key,
    required this.assetPath,
    required this.width,
    required this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        // color: context.primaryBgCardLow,
        color: color ?? context.primaryBgCardHigh,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: context.primaryBgCard,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Image.asset(
            assetPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
