import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class BadgeText extends StatelessWidget {
  final String text;
  final Color? bgColor;
  const BadgeText({super.key, required this.text, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingSize.md,
        vertical: SpacingSize.sm,
      ),
      decoration: BoxDecoration(
        color: bgColor ?? context.primaryColor.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        text,
        style: context.appText.caption.copyWith(
          fontWeight: FontWeight.w900,
          color: context.primaryColor,
        ),
      ),
    );
  }
}
