import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/feature/items/register/widgets/item_highticon.dart';
import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final int? maxLen;
  final bool toUpperCase;

  const SimpleTextField({
    super.key,
    required this.icon,
    required this.label,
    required this.hint,
    required this.controller,
    this.maxLen,
    this.toUpperCase = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ItemHighticon(iconData: icon),
        const SizedBox(width: SpacingSize.md),
        Expanded(
          child: TextField(
            controller: controller,
            maxLength: maxLen,
            decoration: InputDecoration(
              counterText: '',
              labelText: label,
              hintText: hint,
              labelStyle: TextStyle(
                color: context.secondaryColor,
                fontWeight: FontWeight.w800,
              ),
              filled: true,
              fillColor: const Color(0xFFF5F7FD),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(RadiusSize.md),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: SpacingSize.md,
                vertical: SpacingSize.md,
              ),
            ),
            onChanged: (v) {
              if (!toUpperCase) return;
              final up = v.toUpperCase();
              if (up != v) {
                controller.text = up;
                controller.selection =
                    TextSelection.collapsed(offset: controller.text.length);
              }
            },
          ),
        ),
      ],
    );
  }
}
