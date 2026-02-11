import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class HighlightIcon extends StatelessWidget {
  final Icon icon;
  final Color? bgColor;
  final double? containerSize;
  final double? radius;
  final Border? border;
  const HighlightIcon({
    super.key,
    required this.icon,
    this.bgColor,
    this.containerSize,
    this.radius,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize ?? IconContainerSizes.lg,
      height: containerSize ?? IconContainerSizes.lg,
      decoration: BoxDecoration(
        color: bgColor ?? context.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(radius ?? RadiusSize.md),
        border: border,
      ),
      child: icon,
      // child: Icon(
      //   Icons.location_off_rounded,
      //   size: IconSizes.xxl,
      //   color: context.primaryColor(),
      // ),
    );
  }
}
