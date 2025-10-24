import 'package:flutter/material.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

class PrimaryTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final bool? obscureText;
  final int? maxLine;
  const PrimaryTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.obscureText,
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      obscureText: obscureText ?? false,
      maxLines: maxLine,
      style: context.getTextStyle.regular.copyWith(
        height: 1.4,
        letterSpacing: 0.1,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 22,
          horizontal: 20,
        ),
      ),
      validator: (value) {
        return null;
      },
      onFieldSubmitted: (_) {},
    );
  }
}
