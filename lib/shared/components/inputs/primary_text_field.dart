import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class PrimaryTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final bool? obscureText;
  final int? maxLine;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  const PrimaryTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.obscureText,
    this.maxLine = 1,
    this.errorText,
    this.onChanged,
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
        errorText: errorText,
        floatingLabelStyle: TextStyle(
          color: errorText?.isNotEmpty == true ? Colors.red : AppColors.primary,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
