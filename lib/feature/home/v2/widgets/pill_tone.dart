import 'package:deehelp/core/extension/color_extension.dart';
import 'package:flutter/material.dart';

enum Tone { success, neutral }

class PillTone extends StatelessWidget {
  final String text;
  final IconData icon;
  final Tone tone;

  const PillTone({
    super.key,
    required this.text,
    required this.icon,
    required this.tone,
  });

  @override
  Widget build(BuildContext context) {
    final color = switch (tone) {
      // _PillTone.success => const Color(0xFF22C55E),
      Tone.success => context.primaryColor,
      Tone.neutral => const Color(0xFF6B7280),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
