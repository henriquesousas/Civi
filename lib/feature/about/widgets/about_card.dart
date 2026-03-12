import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
  final Widget child;
  const AboutCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: context.surfaceColor,
        color: context.surfaceColor,
        // color: context.surfaceColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}
