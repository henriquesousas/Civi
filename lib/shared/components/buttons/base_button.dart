import 'package:flutter/material.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

abstract class BaseButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final double? borderRadius;
  final TextStyle? textStyle;

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
  });

  Color getBackgroundColor();
  Color getForegroundColor();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: getBackgroundColor(),
          foregroundColor: getForegroundColor(),
          elevation: 0,
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
