import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
import 'package:flutter/material.dart';

class TypeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const TypeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final border = selected ? context.primaryColor : const Color(0xFFE6EAF6);
    final bg =
        selected ? context.primaryColor.withValues(alpha: 0.08) : Colors.white;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(RadiusSize.xl),
      child: Container(
        padding: const EdgeInsets.all(LayoutSpacingSize.container),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(RadiusSize.xl),
          border: Border.all(color: border),
          boxShadow: const [
            BoxShadow(
              color: Color(0x142B5BEE),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            HighlightIcon(
              bgColor: selected
                  ? context.primaryColor.withValues(alpha: 0.16)
                  : const Color(0xFFF5F7FD),
              icon: Icon(
                icon,
                color: selected ? context.primaryColor : context.onSurface,
              ),
            ),
            const SizedBox(width: SpacingSize.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.appText.headermd,
                  ),
                  const SizedBox(height: SpacingSize.xs),
                  Text(
                    subtitle,
                    style: context.appText.caption.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              selected ? Icons.check_circle : Icons.circle_outlined,
              color: selected ? context.primaryColor : const Color(0xFF8A96C8),
            ),
          ],
        ),
      ),
    );
  }
}
