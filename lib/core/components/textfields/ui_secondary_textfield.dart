import 'package:deehelp/core/components/textfields/upper_case_text_formatter.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class UISecondaryTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final bool upperCase;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final int? maxLines;
  final int? minLines;
  final bool? obscureText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final VoidCallback? onTap;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final String? Function(String?)? validator;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? errorBorder;
  final OutlineInputBorder? focusedErrorBorder;
  final String? initialValue;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool? enabled;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final bool? filled;
  final EdgeInsetsGeometry? contentPadding;

  const UISecondaryTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.prefixIcon,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.obscureText,
    this.maxLines = 1,
    this.minLines,
    this.errorText,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.onTap,
    this.labelStyle,
    this.hintStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.initialValue,
    this.upperCase = false,
    this.focusNode,
    this.maxLength,
    this.enabled = true,
    this.controller,
    this.textInputAction,
    this.fillColor,
    this.filled = false,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: onTap != null,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          initialValue: initialValue,
          keyboardType: textInputType,
          textInputAction: textInputAction ?? TextInputAction.done,
          obscureText: obscureText ?? false,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          enabled: enabled,
          buildCounter: (context,
                  {required currentLength,
                  required isFocused,
                  required maxLength}) =>
              null,
          inputFormatters: upperCase ? [UpperCaseTextFormatter()] : null,
          decoration: InputDecoration(
            filled: filled,
            fillColor:
                fillColor ?? AppColors.primaryColorDark.withValues(alpha: 0.05),
            enabledBorder: enabledBorder ?? _getDefaultEnabledBorder(),
            focusedBorder: focusedBorder ?? _getDefaultFocusedBorder(),
            errorBorder: errorBorder ?? _getDefaultErrorBorder(),
            focusedErrorBorder:
                focusedErrorBorder ?? _getDefaultFocusedErrorBorder(),
            labelText: labelText,
            hintText: hintText ?? labelText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            errorText: errorText,
            labelStyle: labelStyle ?? _getDefaultLabelStyle(),
            hintStyle: hintStyle ?? _getDefaultHintStyle(),
            floatingLabelStyle: TextStyle(
              color: errorText?.isNotEmpty == true
                  ? AppColors.errorColor
                  : AppColors.primaryColorDark,
            ),
            isDense: true,
            contentPadding: contentPadding ?? const EdgeInsets.all(16.0),
          ),
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
        ),
      ),
    );
  }

  OutlineInputBorder _getDefaultEnabledBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryColorDark.withValues(alpha: 0.9),
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  OutlineInputBorder _getDefaultFocusedBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.primaryColorDark,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  OutlineInputBorder _getDefaultErrorBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.errorColor.withOpacity(0.5),
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  OutlineInputBorder _getDefaultFocusedErrorBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.errorColor,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  TextStyle _getDefaultLabelStyle() {
    return const TextStyle(
      color: AppColors.primaryColorDark,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle _getDefaultHintStyle() {
    return TextStyle(
      color: AppColors.primaryColorDark.withValues(alpha: 0.6),
    );
  }
}
