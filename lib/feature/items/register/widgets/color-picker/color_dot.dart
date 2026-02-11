import 'package:deehelp/feature/items/register/widgets/color-picker/color_option.dart';
import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  final ColorOption option;
  final double size;

  const ColorDot({super.key, required this.option, this.size = 16});

  @override
  Widget build(BuildContext context) {
    final border = option.border ?? option.color.withValues(alpha: 0.25);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: option.color,
        shape: BoxShape.circle,
        border: Border.all(color: border, width: 1),
      ),
    );
  }
}
