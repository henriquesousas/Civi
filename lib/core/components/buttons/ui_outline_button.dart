import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/theme/button_theme.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class UIOutlineButton extends StatelessWidget {
  final String text;
  final bool loading;
  final VoidCallback? press;
  final double? width;
  final Color? borderColor;
  final Color? textColor;

  const UIOutlineButton({
    super.key,
    required this.text,
    this.press,
    this.width,
    this.loading = false,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.screenWidth,
      child: OutlinedButton(
        onPressed: press,
        style: outlinedButtonTheme(borderColor: borderColor).style,
        child: loading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.primaryColor,
                ),
              )
            : Text(
                text,
                style: DefaultTextStyle.of(context).style.copyWith(
                      color: textColor ?? AppColors.primaryColor,
                    ),
              ),
      ),
    );
  }
}
