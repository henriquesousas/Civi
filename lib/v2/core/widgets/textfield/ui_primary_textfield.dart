import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UIPrimaryTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final int? maxLength;
  final int maxLine;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final bool readOnly;
  const UIPrimaryTextfield({
    super.key,
    this.controller,
    this.suffixIcon,
    this.hintText,
    this.inputFormatters,
    this.maxLength,
    this.textInputAction,
    this.prefixIcon,
    this.onTap,
    this.readOnly = false,
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      // focusNode: _focus,
      focusNode: readOnly ? (FocusNode()..canRequestFocus = false) : null,
      maxLength: maxLength,
      maxLines: maxLine,
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle(
        color: Color(0xFFF3F7FF),
        fontWeight: FontWeight.w700,
      ),
      textInputAction: textInputAction ?? TextInputAction.done,
      inputFormatters: inputFormatters,
      // inputFormatters: [
      //   FilteringTextInputFormatter.allow(
      //     RegExp(r"[A-Za-zÀ-ÿ0-9 '._-]"),
      //   ),
      //   LengthLimitingTextInputFormatter(24),
      // ],
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.appText.bodyLarger.copyWith(
          color: context.themeColor.secundaryTextColor.withValues(alpha: 0.4),
        ),
        counterStyle: TextStyle(
          color: context.themeColor.secundaryTextColor,
        ),
        filled: true,
        fillColor: context.themeColor.secundaryBgColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeRadius.m),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeRadius.m),
          borderSide: BorderSide(
            color: context.themeColor.outlineVariant,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeRadius.m),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.4,
          ),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      onSubmitted: (_) => {},
    );
  }
}
