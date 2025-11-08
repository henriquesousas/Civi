import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class UIPrimaryTextField extends StatelessWidget {
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final bool? obscureText;
  final int? maxLine;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

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
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: onTap != null, //
        child: TextFormField(
          keyboardType: textInputType,
          textInputAction: TextInputAction.next,
          obscureText: obscureText ?? false,
          maxLines: maxLine,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            errorText: errorText,
            floatingLabelStyle: TextStyle(
              color: errorText?.isNotEmpty == true
                  ? AppColors.errorColor
                  : AppColors.primaryColor,
            ),
            isDense: false, //
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
