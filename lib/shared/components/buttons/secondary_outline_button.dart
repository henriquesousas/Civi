import 'package:flutter/material.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

import '../../../app/theme/app_colors.dart';

class SecondaryOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final double? height;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Color? foregroundColor;
  final Color? borderColor;

  const SecondaryOutlineButton({
    super.key,
    this.padding,
    this.onPressed,
    this.height,
    this.textStyle,
    this.borderRadius,
    this.foregroundColor,
    this.borderColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor ?? AppColors.primary,
          side: BorderSide(
            color: borderColor ?? AppColors.primary,
          ),
          padding: EdgeInsets.symmetric(vertical: height ?? 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: textStyle ?? context.getTextStyle.mediumSmall,
        ),
      ),
    );
  }
}
