import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final int maxLine;

  const SmallText({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLine = 1,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: textStyle,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
