import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class MetaPill extends StatelessWidget {
  final IconData icon;
  final String text;

  const MetaPill({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingSize.sm,
        vertical: SpacingSize.sm,
      ),
      decoration: BoxDecoration(
        color: context.secondaryContainer,
        borderRadius: BorderRadius.circular(RadiusSize.xxl),
        border: Border.all(color: context.outlineVariantColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: IconSizes.xs, color: context.secondaryColor),
          const SizedBox(width: SpacingSize.sm),
          Text(
            text,
            style: context.appTextOld.caption.copyWith(
              fontWeight: FontWeight.w800,
              color: context.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
