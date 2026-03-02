import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class GoogleGMark extends StatelessWidget {
  const GoogleGMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: IconSizes.md,
      height: IconSizes.md,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: const Center(
        child: Text(
          'G',
          style: TextStyle(
            color: Color(0xFF1F2A44),
            fontWeight: FontWeight.w900,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
