import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class ExpandableCard extends StatelessWidget {
  final bool selected;
  final String title;
  final String subtitle;
  final String badge;
  final IconData icon;
  final VoidCallback onTap;
  final Widget child;

  const ExpandableCard({
    super.key,
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.icon,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final border =
        selected ? AppColors.primaryColor : context.outlineVariantColor;
    final bg = selected
        ? context.primaryColor.withValues(alpha: 0.01)
        : Colors.grey.withValues(alpha: 0.2);

    return InkWell(
      borderRadius: BorderRadius.circular(RadiusSize.xl),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(RadiusSize.xl),
          border: Border.all(color: border, width: selected ? 2 : 1),
          boxShadow: const [
            BoxShadow(
              color: Color(0x142B5BEE),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(LayoutSpacingSize.container),
              child: Row(
                children: [
                  HighlightIcon(
                    icon: Icon(icon, color: context.primaryColor),
                  ),
                  const SizedBox(width: SpacingSize.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: context.appText.headermd,
                            ),
                            const SizedBox(width: SpacingSize.sm),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: context.primaryColor,
                                borderRadius: BorderRadius.circular(99),
                              ),
                              child: Text(
                                badge,
                                style: context.appText.caption.copyWith(
                                  color: context.surface,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: SpacingSize.sm),
                        Text(
                          subtitle,
                          style: context.appText.caption.copyWith(
                            height: 1.25,
                            fontWeight: FontWeight.w600,
                            color: context.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: selected ? 0.25 : 0,
                    duration: const Duration(milliseconds: 180),
                    child: Icon(Icons.chevron_right,
                        color: context.secondaryColor),
                  ),
                ],
              ),
            ),
            if (selected) ...[
              Divider(height: 1, color: context.surface),
              child,
            ],
          ],
        ),
      ),
    );
  }
}
