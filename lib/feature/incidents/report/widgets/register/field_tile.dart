import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class FieldTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const FieldTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(RadiusSize.lg),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            HighlightIcon(
              icon: Icon(icon, size: IconSizes.md),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: context.appText.caption.copyWith(
                      fontWeight: FontWeight.w800,
                      color: context.secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: context.appText.bodySmall.copyWith(
                      fontWeight: FontWeight.w900,
                      color: context.onSurface,
                    ),
                  ),
                  // const SizedBox(height: 4),
                  // Text(
                  //   "A data não pode ser no futuro!",
                  //   style: context.appText.bodySmall.copyWith(
                  //     fontWeight: FontWeight.w900,
                  //     color: context.onSurface,
                  //   ),
                  // ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: context.secondaryColor),
          ],
        ),
      ),
    );
  }
}
