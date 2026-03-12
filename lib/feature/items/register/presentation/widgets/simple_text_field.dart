import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/textfield/upper_case_text_formatter.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/item_highticon.dart';
import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final int? maxLen;
  final bool toUpperCase;
  final Function(String)? onChanged;
  final String? error;

  const SimpleTextField({
    super.key,
    required this.icon,
    required this.label,
    required this.hint,
    this.maxLen,
    this.toUpperCase = false,
    this.onChanged,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ItemHighticon(iconData: icon),
        const SizedBox(width: SpacingSize.md),
        Expanded(
          child: TextField(
              maxLength: maxLen,
              decoration: InputDecoration(
                counterText: '',
                labelText: label,
                hintText: hint,
                errorText: error,
                labelStyle: TextStyle(
                  color: context.secondaryColor,
                  fontWeight: FontWeight.w800,
                ),
                filled: true,
                // fillColor: const Color(0xFFF5F7FD),
                fillColor: context.outlineVariantColor.withValues(alpha: 0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RadiusSize.md),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: SpacingSize.md,
                  vertical: SpacingSize.md,
                ),
              ),
              inputFormatters: toUpperCase
                  ? [
                      UpperCaseTextFormatter(),
                    ]
                  : null,
              onChanged: (text) {
                if (onChanged != null) {
                  onChanged!(text);
                }
              }),
        ),
      ],
    );
  }
}
