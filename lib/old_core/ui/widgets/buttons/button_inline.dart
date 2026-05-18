import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/ui/styles/app_text_style.dart';
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
        // style: const TextStyle(fontWeight: FontWeight.w900).copyWith(
        //   color: textColor ?? Colors.white,
        // ),
        style: context.appTextOld.button.copyWith(
          color: textColor ?? context.onSurface,
        ),
      ),
    );
  }
}
