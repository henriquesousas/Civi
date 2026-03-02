import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class UICategoryButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color? color, textColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double textSize;

  const UICategoryButton({
    super.key,
    required this.text,
    this.horizontalPadding = 3,
    this.verticalPadding = 3,
    this.textSize = 11,
    required this.press,
    this.color,
    this.textColor = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? const Color(0xFF2B5BEE),
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: press,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            text,
            style: context.appTextStyles.bodyTextStyle1.copyWith(
              color: textColor,
              fontSize: textSize,
            ),
          ),
        ),
      ),
    );
  }
}
