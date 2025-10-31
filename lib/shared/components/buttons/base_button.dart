import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

abstract class BaseButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final double? borderRadius;
  final TextStyle? textStyle;
  final bool isLoading;

  const BaseButton({
    super.key,
    required this.text,
    this.onPressed,
    this.padding,
    this.height,
    this.width,
    this.borderRadius,
    this.textStyle,
    this.backgroundColor,
    this.isLoading = false,
  });

  Color getBackgroundColor();
  Color getForegroundColor();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.screenWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: getBackgroundColor(),
          foregroundColor: getForegroundColor(),
          elevation: 0,
          padding: EdgeInsets.symmetric(
              vertical: height ?? context.percentHeight(0.016)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.lineColor,
                ),
              )
            : Text(
                text,
                style: textStyle ?? context.getTextStyle.mediumSmall,
              ),
      ),
    );
  }
}
