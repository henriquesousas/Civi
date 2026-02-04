import 'package:flutter/material.dart';

class InlineButton extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const InlineButton({super.key, required this.press, required this.text});

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
