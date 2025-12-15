import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../../theme/dimens.dart';

class UIElevatedButton extends StatelessWidget {
  final String text;
  final double radius;
  final double elevation;
  final Color? bgColor;
  final Color? textColor;
  final Color borderColor;
  final Color? shadowColor;
  final double width;
  final double height;
  final Widget? icon;
  final bool isLoading;
  final bool isEnabled;
  final IconAlignment iconAlignment;
  final void Function() press;

  const UIElevatedButton({
    super.key,
    required this.text,
    required this.press,
    this.radius = Dimens.defaultButtonRadius,
    this.elevation = 0,
    this.bgColor,
    this.shadowColor,
    this.width = double.infinity,
    this.height = 50,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.iconAlignment = IconAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.primaryColor;
    return icon != null
        ? ElevatedButton.icon(
            iconAlignment: iconAlignment,
            icon: isLoading
                ? const SizedBox.shrink()
                : icon ?? const SizedBox.shrink(),
            onPressed: () {
              if (isLoading == false) {
                // MyUtils.clearAllTypeFocusNodes();
                press();
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
          )
        : ElevatedButton(
            onPressed: () {
              if (isEnabled == false) return;
              if (isLoading == false) {
                // MyUtils.clearAllTypeFocusNodes();
                press();
              }
            },
            style: ElevatedButton.styleFrom(
              // backgroundColor: bgColor ?? primary,
              // backgroundColor:   Colors.grey.withValues(alpha: 0.5),
              backgroundColor: isEnabled
                  ? (bgColor ?? primary)
                  : Colors.grey.withValues(alpha: 0.5),
              elevation: elevation,
              shadowColor: shadowColor ?? primary.withValues(alpha: 0.5),
              overlayColor: bgColor ?? primary.withValues(alpha: 0.1),
              splashFactory: InkRipple.splashFactory,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(radius),
              ),
              maximumSize: Size.fromHeight(height),
              minimumSize: Size(width, height),
            ),
            child: isLoading
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
