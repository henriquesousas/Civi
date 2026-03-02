import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class HighlightIconGradient extends StatelessWidget {
  final Icon icon;
  const HighlightIconGradient({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: IconSizes.xxxl,
      height: IconSizes.xxxl,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusSize.md),
        gradient: const LinearGradient(
          colors: [Color(0xFF2B5BEE), Color(0xFF5F85FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: icon,
    );
  }
}
