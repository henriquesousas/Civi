import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/size/radius_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPrimary extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String labelText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  const TextFieldPrimary(
      {super.key,
      required this.controller,
      required this.hint,
      required this.labelText,
      this.inputFormatters,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: context.secondaryColor,
            fontWeight: FontWeight.w800,
          ),
          hintText: hint,
          filled: true,
          fillColor: const Color(0xFFF5F7FD),
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
