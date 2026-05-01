import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:flutter/material.dart';

class UIButtonIcon extends StatelessWidget {
  final VoidCallback tap;
  final String title;
  final Widget icon;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  const UIButtonIcon({
    super.key,
    required this.tap,
    required this.title,
    required this.icon,
    this.buttonStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: tap,
      icon: icon,
      label: Text(
        title,
        style: textStyle ??
            context.appText.button.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
      ),
      style: buttonStyle ??
          OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: const BorderSide(
              color: Color(0xFF22314D),
            ),
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 13),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
          ),
    );
  }
}
