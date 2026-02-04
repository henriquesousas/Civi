import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class HighlightIcon extends StatelessWidget {
  final Icon icon;
  final Color? bgColor;
  final double? containerSize;
  final double? radius;
  const HighlightIcon({
    super.key,
    required this.icon,
    this.bgColor,
    this.containerSize,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize ?? IconContainerSizes.lg,
      height: containerSize ?? IconContainerSizes.lg,
      decoration: BoxDecoration(
        color: bgColor ?? context.primaryColorOpacity(0.1),
        borderRadius: BorderRadius.circular(radius ?? RadiusSize.md),
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
