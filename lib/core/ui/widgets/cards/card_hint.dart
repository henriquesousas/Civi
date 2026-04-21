import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class CardHint extends StatelessWidget {
  final String title;
  final String message;
  final Icon? icon;
  final Color? backgroundColor;
  final Color? iconBackgroundColor;
  final double? iconContainerSize;
  final Border? border;
  final TextStyle? textStyle;

  const CardHint({
    super.key,
    required this.title,
    required this.message,
    this.icon,
    this.backgroundColor,
    this.iconBackgroundColor,
    this.iconContainerSize,
    this.border,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(LayoutSpacingSize.card),
      decoration: BoxDecoration(
        color: backgroundColor ?? context.primaryColor.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        border: border ??
            Border.all(color: context.primaryColor.withValues(alpha: 0.20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Container(
              width: iconContainerSize ?? IconContainerSizes.md,
              height: iconContainerSize ?? IconContainerSizes.md,
              decoration: BoxDecoration(
                color: iconBackgroundColor ??
                    context.primaryColor.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(14),
                border: backgroundColor != null
                    ? Border.all(
                        color: backgroundColor!.withValues(alpha: 0.18),
                      )
                    : Border.all(
                        color: context.primaryColor.withValues(alpha: 0.18),
                      ),
              ),
              child: icon,
            ),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.appTextOld.headermd,
                ),
                const SizedBox(height: SpacingSize.xs),
                Text(
                  message,
                  style: textStyle ??
                      context.appTextOld.bodySmall.copyWith(
                        height: 1.35,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
