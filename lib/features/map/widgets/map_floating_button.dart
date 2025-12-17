import 'package:flutter/material.dart';

import '../../../core/ui/theme/app_colors.dart';

class MapFloatButton extends StatelessWidget {
  final Offset offset;
  final VoidCallback press;
  final double bottom;
  final double right;
  final double left;
  final double top;
  final Widget child;
  final Color backgroundColor;
  final Color foregroundColor;
  const MapFloatButton({
    super.key,
    required this.offset,
    required this.press,
    required this.bottom,
    required this.right,
    required this.child,
    this.top = 0,
    this.left = 0,
    this.backgroundColor = AppColors.whiteColor,
    this.foregroundColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'center_fab',
      elevation: 2,
      mini: true,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      onPressed: press,
      child: child,
    );
  }
}
