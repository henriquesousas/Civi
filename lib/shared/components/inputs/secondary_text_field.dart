import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors_v2.dart';

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
            color: AppColorsV2.textPrimary,
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
            fillColor: AppColorsV2.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColorsV2.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColorsV2.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: AppColorsV2.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColorsV2.error),
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
