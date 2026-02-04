import 'package:app_core/src/extension/theme_color_extension.dart';
import 'package:app_core/src/theme/size/icon_container_size.dart';
import 'package:app_core/src/theme/size/layout_spacing_size.dart';
import 'package:app_core/src/theme/size/radius_size.dart';
import 'package:app_core/src/theme/size/spacing_size.dart';
import 'package:app_core/src/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class CardHint extends StatelessWidget {
  final String title;
  final String message;
  final Icon? icon;
  final Color? backgroundColor;
  final Color? iconBackgroundColor;
  final double? iconContainerSize;

  const CardHint({
    super.key,
    required this.title,
    required this.message,
    this.icon,
    this.backgroundColor,
    this.iconBackgroundColor,
    this.iconContainerSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(LayoutSpacingSize.card),
      decoration: BoxDecoration(
        color: backgroundColor ?? context.primaryColorOpacity(0.08),
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        border: Border.all(color: context.primaryColorOpacity(0.20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Container(
              width: iconContainerSize ?? IconContainerSizes.md,
              height: iconContainerSize ?? IconContainerSizes.md,
              decoration: BoxDecoration(
                color: iconBackgroundColor ?? context.primaryColorOpacity(0.14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: context.primaryColorOpacity(0.18)),
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
                  style: context.appText.headersm,
                ),
                const SizedBox(height: SpacingSize.xs),
                Text(
                  message,
                  style: context.appText.bodySmall.copyWith(
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
