import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final bool isRequired;
  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  const LabelText({
    super.key,
    required this.text,
    this.textAlign,
    this.textStyle,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(
        text: text,
        style: textStyle ??
            context.appTextStyles.buttonTextStyle1.copyWith(
              color: AppColors.textColorHeader,
              fontWeight: FontWeight.bold,
            ),
        children: isRequired
            ? [
                TextSpan(
                  text: ' *',
                  style: context.appTextStyles.bodyTextStyle1.copyWith(
                    color: AppColors.errorColor,
                  ),
                ),
              ]
            : [],
      ),
    );
  }
}
