import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class SeeDetailButton extends StatelessWidget {
  final String text;
  final Alignment alignment;
  final bool showIndicator;
  const SeeDetailButton(
      {super.key,
      required this.alignment,
      required this.text,
      this.showIndicator = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingSize.sm,
          vertical: SpacingSize.sm,
        ),
        decoration: BoxDecoration(
          color: context.secondaryContainer,
          borderRadius: BorderRadius.circular(RadiusSize.md),
          border: Border.all(color: context.outlineVariantColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: context.appText.caption.copyWith(
                color: context.secondaryColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            if (showIndicator) ...[
              const SizedBox(width: SpacingSize.sm),
              Icon(
                Icons.chevron_right_rounded,
                color: context.secondaryColor,
                size: IconSizes.sm,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
