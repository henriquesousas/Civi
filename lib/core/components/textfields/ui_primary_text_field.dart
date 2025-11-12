import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class UIPrimaryTextField extends StatelessWidget {
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final int? maxLine;
  final bool? obscureText;
  final TextStyle? labelStyle;
  final VoidCallback? onTap;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final OutlineInputBorder? enabledBorder;
  final String? initialValue;

  const UIPrimaryTextField({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.obscureText,
    this.maxLine = 1,
    this.errorText,
    this.onChanged,
    this.onTap,
    this.labelStyle,
    this.enabledBorder,
    this.initialValue,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: onTap != null, //
        child: TextFormField(
          initialValue: initialValue,
          keyboardType: textInputType,
          textInputAction: TextInputAction.next,
          obscureText: obscureText ?? false,
          maxLines: maxLine,
          decoration: InputDecoration(
            enabledBorder: enabledBorder,
            labelText: labelText,
            hintText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            errorText: errorText,
            labelStyle: labelStyle,
            floatingLabelStyle: TextStyle(
              color: errorText?.isNotEmpty == true
                  ? AppColors.errorColor
                  : AppColors.primaryColor,
            ),
            isDense: false,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
