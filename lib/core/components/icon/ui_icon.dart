import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class UIICon extends StatelessWidget {
  final Color bgColor;
  final Widget icon;
  final double radius;
  final double padding;
  const UIICon({
    super.key,
    this.padding = 12,
    this.radius = 50,
    required this.bgColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: AppColors.lightGreyColor20, width: 1),
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 15,
              spreadRadius: 0,
              offset: const Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: icon,
      ),
    );
  }
}
