import 'package:flutter/material.dart';

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
          borderRadius: BorderRadius.circular(radius),
        ),
        child: icon,
      ),
    );
  }
}
