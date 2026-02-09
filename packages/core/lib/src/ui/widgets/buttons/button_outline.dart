import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  final VoidCallback press;
  final String text;
  final Icon? icon;
  final Color? bgColor;
  final Color? textColor;
  const ButtonOutline(
      {super.key,
      required this.press,
      required this.text,
      this.icon,
      this.bgColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ButtonSize.sm,
      child: OutlinedButton.icon(
        onPressed: press,
        // icon: const Icon(Icons.share_outlined),
        icon: icon,
        label: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w900).copyWith(
            color: textColor ?? context.primaryColor(),
          ),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: context.primaryColor(),
          backgroundColor: bgColor,
          side: BorderSide(
            color: context.primaryColor().withValues(alpha: 0.32),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiusSize.md),
          ),
        ),
      ),
    );
  }
}
