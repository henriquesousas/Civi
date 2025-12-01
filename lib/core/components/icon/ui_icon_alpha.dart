import 'package:flutter/material.dart';

class UIIConAlpha extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final double iconSize;
  final double borderRadius;
  final double padding;
  final VoidCallback? press;
  const UIIConAlpha({
    super.key,
    required this.iconData,
    required this.color,
    this.iconSize = 20,
    this.padding = 12,
    this.borderRadius = 30,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: IconButton(
          onPressed: press,
          icon: Icon(
            iconData,
            color: color,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
