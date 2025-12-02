import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class UISecondaryButton extends StatelessWidget {
  final String text;
  final bool loading;
  final VoidCallback? press;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final double? borderRadius;
  final TextStyle? textStyle;

  const UISecondaryButton({
    super.key,
    required this.text,
    this.press,
    this.padding,
    this.height,
    this.width,
    this.borderRadius,
    this.textStyle,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.screenWidth,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
        ),
        child: loading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.whiteColor,
                ),
              )
            : Text(
                text,
                style: textStyle ??
                    DefaultTextStyle.of(context).style.copyWith(
                          color: AppColors.primaryColor,
                        ),
              ),
      ),
    );
  }
}
