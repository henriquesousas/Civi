import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

// TOD: Deixar no core
class ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isPrimary;

  const ActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(RadiusSize.lg),
      child: Container(
        padding: const EdgeInsets.all(SpacingSize.md),
        decoration: BoxDecoration(
          color: isPrimary
              // ? context.primaryColor.withValues(alpha: 0.08)
              ? AppColors.primaryColor.withValues(alpha: 0.08)
              : const Color(0xFFF5F7FD),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isPrimary
                ? context.primaryColor.withValues(alpha: 0.20)
                : const Color(0xFFE6EAF6),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: IconContainerSizes.lg,
              height: IconContainerSizes.lg,
              decoration: BoxDecoration(
                color: isPrimary
                    ? context.primaryColor.withValues(alpha: 0.14)
                    : context.onSurface.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(RadiusSize.md),
              ),
              child: Icon(icon,
                  color: isPrimary ? context.primaryColor : context.onSurface,
                  size: IconSizes.md),
            ),
            const SizedBox(width: SpacingSize.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.appTextOld.bodySmall.copyWith(
                      color: context.primaryTextColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: SpacingSize.sm),
                  Text(
                    subtitle,
                    style: context.appTextOld.caption.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.secondaryTextColor,
                    ),
                  ),
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
