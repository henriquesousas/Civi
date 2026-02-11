import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  final VoidCallback press;
  final String text;
  final Widget? icon;
  final Color? bgColor;
  final Color? textColor;
  final BorderSide? side;
  final double? height;
  const ButtonOutline(
      {super.key,
      required this.press,
      required this.text,
      this.icon,
      this.bgColor,
      this.textColor,
      this.side,
      this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? ButtonSize.sm,
      child: OutlinedButton.icon(
        onPressed: press,
        icon: icon,
        label: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w900).copyWith(
            color: textColor ?? context.primaryColor,
          ),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: context.primaryColor,
          backgroundColor: bgColor,
          side: side ??
              BorderSide(
                color: context.primaryColor.withValues(alpha: 0.32),
              ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiusSize.md),
          ),
        ),
      ),
    );
  }
}
