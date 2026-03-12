import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ButtonEdit extends StatelessWidget {
  final VoidCallback onTap;
  const ButtonEdit({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(99),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7FD),
          borderRadius: BorderRadius.circular(99),
          border: Border.all(color: const Color(0xFFE6EAF6)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.edit_outlined,
              size: IconSizes.xs,
              color: context.surface,
            ),
            const SizedBox(width: 2),
            Text(
              'Editar',
              style: context.appText.caption.copyWith(
                fontWeight: FontWeight.w900,
                color: context.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
