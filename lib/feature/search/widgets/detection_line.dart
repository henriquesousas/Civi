import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class DetectionLine extends StatelessWidget {
  final String text;
  final bool isOk;

  const DetectionLine({super.key, required this.text, required this.isOk});

  @override
  Widget build(BuildContext context) {
    final color = isOk ? const Color(0xFF43A047) : const Color(0xFF8A96C8);
    final icon = isOk ? Icons.verified_outlined : Icons.info_outline;

    return Row(
      children: [
        Icon(icon, size: IconSizes.xs, color: color),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: context.appTextOld.caption.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
