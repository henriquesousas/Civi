import 'package:flutter/material.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

import '../../../app/theme/app_colors.dart';

class SecondaryTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  const SecondaryTextField({
    super.key,
    required this.label,
    required this.hint,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.getTextStyle.regular.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          // controller: controller,
          // focusNode: focusNode,
          keyboardType: keyboardType,
          // validator: validator,
          // textInputAction: textInputAction,
          // onFieldSubmitted: onSubmitted,
          style: context.getTextStyle.regular.copyWith(
            height: 1.4,
            letterSpacing: 0.1,
          ),
          decoration: InputDecoration(
            hintText: hint,
            // hintStyle: AppTextStyles.inputHint,
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 22,
              horizontal: 20,
            ),
          ),
        ),
      ],
    );
  }
}
