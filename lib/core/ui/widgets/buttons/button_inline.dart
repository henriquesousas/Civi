import 'package:flutter/material.dart';

class ButtonInline extends StatelessWidget {
  final String text;
  final Color? textColor;
  final VoidCallback press;

  const ButtonInline(
      {super.key, required this.press, required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w900).copyWith(
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
