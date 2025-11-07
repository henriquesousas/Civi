import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class UIPrimaryButton extends StatelessWidget {
  final String text;
  final bool loading;
  final Color? bgColor;
  final VoidCallback? press;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final double? borderRadius;
  final TextStyle? textStyle;

  const UIPrimaryButton({
    super.key,
    required this.text,
    this.press,
    this.padding,
    this.height,
    this.width,
    this.borderRadius,
    this.textStyle,
    this.bgColor,
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
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
            : Text(text),
      ),
    );
  }
}
