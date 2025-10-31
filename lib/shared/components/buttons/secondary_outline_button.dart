import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

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
  final double? width;

  const SecondaryOutlineButton({
    super.key,
    this.padding,
    this.onPressed,
    this.height,
    this.textStyle,
    this.borderRadius,
    this.foregroundColor,
    this.borderColor,
    this.width,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.screenWidth,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor ?? AppColors.primary,
          side: BorderSide(
            color: borderColor ?? AppColors.primary,
          ),
          padding: EdgeInsets.symmetric(
              vertical: height ?? context.percentHeight(0.016)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
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
