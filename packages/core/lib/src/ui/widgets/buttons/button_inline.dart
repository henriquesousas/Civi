import 'package:flutter/material.dart';

class ButtonInline extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const ButtonInline({super.key, required this.press, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Text(
        text,
      ),
    );
  }
}
