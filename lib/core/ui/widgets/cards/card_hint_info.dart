import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class CardHintInfo extends StatelessWidget {
  final String message;
  final Icon? icon;
  final Color? bgColor;
  final Color? textColor;
  const CardHintInfo(
      {super.key,
      this.icon,
      required this.message,
      this.bgColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor ?? context.primaryBgCard,
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        border: Border.all(color: context.outlineVariantColor),
        // boxShadow: [
        //   BoxShadow(
        //     color: context.shadowColor,
        //     blurRadius: 16,
        //     offset: const Offset(0, 8),
        //   ),
        // ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[icon!],
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Text(
              message,
              style: context.appText.bodySmall.copyWith(
                height: 1.35,
                fontWeight: FontWeight.w500,
                color: textColor ?? context.secondaryTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
