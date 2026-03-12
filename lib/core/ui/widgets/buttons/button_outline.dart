import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  final VoidCallback press;
  final String text;
  final Widget? icon;
  final Color? bgColor;
  final Color? textColor;
  final BorderSide? side;
  final double? height;
  final bool? loading;
  final bool isPrimary;
  final double? width;
  const ButtonOutline({
    super.key,
    required this.press,
    required this.text,
    this.icon,
    this.bgColor,
    this.textColor,
    this.side,
    this.height,
    this.width,
    this.loading = false,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? ButtonSize.xs,
      child: OutlinedButton.icon(
        onPressed: press,
        icon: loading! ? null : icon,
        // label:   Text(
        //   text,
        //   style: const TextStyle(fontWeight: FontWeight.w900).copyWith(
        //     color: textColor ?? context.primaryColor,
        //   ),
        // ),
        label: loading!
            ? _cirucularProgressIndicator(context, isPrimary)
            : _title(context, textColor),
        style: OutlinedButton.styleFrom(
          foregroundColor: context.primaryColor,
          backgroundColor: bgColor,
          side: side ??
              BorderSide(
                color: context.primaryColor.withValues(alpha: 0.32),
              ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiusSize.xl),
          ),
        ),
      ),
    );
  }

  Text _title(BuildContext context, Color? textColor) {
    return Text(
      text,
      style: context.appText.label.copyWith(
        fontWeight: FontWeight.w800,
        color: textColor ?? context.primaryColor,
      ),
    );
  }

  Widget _cirucularProgressIndicator(BuildContext context, bool isPrimary) {
    return SizedBox(
      height: CiruclarProgressIndicatorSize.sm,
      width: CiruclarProgressIndicatorSize.sm,
      child: CircularProgressIndicator(
        color: isPrimary ? context.primaryColor : Colors.white,
      ),
    );
  }
}
