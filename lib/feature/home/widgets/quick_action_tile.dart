import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class QuickActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color accent;
  final VoidCallback onTap;

  const QuickActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(RadiusSize.lg),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7FD),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.greyLight),
        ),
        child: Row(
          children: [
            // HighlightIcon(
            //   bgColor: accent.withValues(alpha: 0.12),
            //   icon: Icon(icon, color: accent, size: 20),
            // ),
            // const SizedBox(width: SpacingSize.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.appText.headersm,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: context.appText.caption.copyWith(
                      color: context.secondaryColor,
                      fontWeight: FontWeight.w700,
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
