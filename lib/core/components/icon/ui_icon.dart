import 'package:flutter/material.dart';

class UIICon extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final double size;
  const UIICon(
      {super.key, required this.iconData, required this.color, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        iconData,
        color: color,
        size: size,
      ),
    );
  }
}
