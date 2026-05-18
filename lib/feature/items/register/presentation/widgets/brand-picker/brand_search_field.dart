import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class BrandSearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  const BrandSearchField(
      {super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (v) => onChanged(v),
      decoration: InputDecoration(
        hintText: 'Buscar marca...',
        prefixIcon: Icon(
          Icons.search,
          color: context.primaryTextColor.withValues(alpha: 0.5),
        ),
        filled: true,
        // fillColor: const Color(0xFFF5F7FD),
        fillColor: context.outlineVariantColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusSize.md),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: LayoutSpacingSize.card,
          vertical: LayoutSpacingSize.card,
        ),
      ),
    );
  }
}
