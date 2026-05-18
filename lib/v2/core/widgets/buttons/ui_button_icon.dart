import 'package:deehelp/old_core/extension/size_extension.dart';
import 'package:deehelp/v2/core/extensions/text_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class UIButtonIcon extends StatelessWidget {
  final VoidCallback press;
  final String title;
  final Widget icon;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final double? width;
  const UIButtonIcon({
    super.key,
    required this.press,
    required this.title,
    required this.icon,
    this.buttonStyle,
    this.textStyle,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.screenWidth,
      child: OutlinedButton.icon(
        onPressed: press,
        icon: icon,
        label: Text(
          title,
          style: textStyle ??
              context.appText.button.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
        ),
        style: buttonStyle ??
            OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(
                color: Color(0xFF22314D),
                // color: Color(0xFF22314D),
              ),
              // backgroundColor: Colors.white,
              backgroundColor: AppColor.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
            ),
      ),
    );
  }
}
