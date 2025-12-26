import 'package:flutter/material.dart';

class UIICon extends StatelessWidget {
  final Color bgColor;
  final Widget icon;
  final double radius;
  final double padding;
  final bool isAlpha;
  final Border? border;
  const UIICon({
    super.key,
    required this.bgColor,
    required this.icon,
    this.padding = 12,
    this.radius = 50,
    this.isAlpha = false,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: isAlpha ? bgColor.withValues(alpha: 0.1) : bgColor,
        borderRadius: BorderRadius.circular(radius),
        border: border,
      ),
      child: icon,
    );
  }
}
