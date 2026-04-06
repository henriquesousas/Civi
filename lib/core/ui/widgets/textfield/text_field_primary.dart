import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/size/radius_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPrimary extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? textInputType;

  final Function(String)? onChanged;
  final String? error;

  const TextFieldPrimary(
      {super.key,
      required this.hint,
      this.controller,
      this.labelText,
      this.inputFormatters,
      this.suffixIcon,
      this.maxLength,
      this.maxLines,
      this.textInputType,
      this.onChanged,
      this.error});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType ?? TextInputType.text,
      maxLength: maxLength,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      onChanged: (text) {
        if (onChanged != null) {
          onChanged!(text);
        }
      },
      style: const TextStyle(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          counterText: '',
          errorText: error,
          counterStyle: TextStyle(color: context.secondaryTextColor),
          labelText: labelText,
          labelStyle: TextStyle(
            color: context.secondaryTextColor,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: TextStyle(
            color: context.secondaryTextColor,
            fontWeight: FontWeight.w500,
          ),
          hintText: hint,
          filled: true,
          // fillColor: const Color(0xFFF5F7FD),
          fillColor: context.primaryBgCardLow,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RadiusSize.md),
            borderSide: BorderSide.none,
          ),
          suffixIcon: suffixIcon

          // suffixIcon: controller.text.isEmpty
          //     ? null
          //     : IconButton(
          //         onPressed: onClear,
          //         icon: const Icon(Icons.close),
          //         color: const Color(0xFF8A96C8),
          //       ),
          ),
    );
  }
}
