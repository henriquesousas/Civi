import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  final String text;
  final IconData icon;

  const Pill({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: context.primaryColor.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: context.primaryColor.withValues(alpha: 0.18),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: IconSizes.xs, color: context.primaryColor),
          const SizedBox(width: 6),
          Text(
            text,
            style: context.appText.caption.copyWith(
              fontWeight: FontWeight.w800,
              color: context.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
