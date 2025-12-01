import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/widgets/buttons/ui_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class UIElevatedIconButton extends UIElevatedButton {
  const UIElevatedIconButton(
      {super.key,
      required super.icon,
      required super.text,
      required super.onTap,
      super.bgColor,
      super.width,
      super.borderColor,
      super.textColor,
      super.elevation,
      super.radius = 120});

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.primaryColor;
    return ElevatedButton.icon(
      iconAlignment: iconAlignment,
      icon:
          isLoading ? const SizedBox.shrink() : icon ?? const SizedBox.shrink(),
      onPressed: () {
        if (isLoading == false) {
          // MyUtils.clearAllTypeFocusNodes();
          onTap();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? primary,
        elevation: elevation,
        surfaceTintColor: bgColor ?? primary.withValues(alpha: 0.5),
        overlayColor: bgColor ?? primary.withValues(alpha: 0.1),
        shadowColor: shadowColor ?? primary.withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(radius),
        ),
        maximumSize: Size.fromHeight(height),
        minimumSize: Size(width, height),
        splashFactory: InkRipple.splashFactory,
      ),
      label: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(color: textColor),
            )
          : Text(
              text,
              style: context.appTextStyles.buttonTextStyle1.copyWith(
                color: textColor,
              ),
            ),
    );
  }
}
