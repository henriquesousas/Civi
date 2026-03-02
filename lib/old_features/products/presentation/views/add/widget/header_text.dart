import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  const HeaderText({
    super.key,
    required this.text,
    this.textAlign,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: textStyle ?? context.appTextStyles.sectionTitle,
    );
  }
}
