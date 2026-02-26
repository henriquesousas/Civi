import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class ToggleChip extends StatelessWidget {
  final bool selected;
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const ToggleChip({
    super.key,
    required this.selected,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: SpacingSize.md, vertical: SpacingSize.md),
        decoration: BoxDecoration(
          color: selected
              ? context.primaryColor.withValues(alpha: 0.12)
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected
                ? context.primaryColor.withValues(alpha: 0.30)
                : const Color(0xFFE6EAF6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: IconSizes.sm,
              color: selected ? context.primaryColor : context.secondaryColor,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: context.appText.caption.copyWith(
                  fontWeight: FontWeight.w900,
                  color: selected ? context.primaryColor : context.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
