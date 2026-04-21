import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class StepTile extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final IconData icon;

  const StepTile({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: IconSizes.xl,
            height: IconSizes.xl,
            decoration: BoxDecoration(
              color: context.primaryColor.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(RadiusSize.md),
            ),
            child: Center(
              child: Text(
                '$index',
                style: TextStyle(
                  color: context.primaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(width: SpacingSize.md),
          HighlightIcon(
            containerSize: IconSizes.xl,
            bgColor: context.onSurface.withValues(alpha: 0.06),
            radius: 12,
            icon: Icon(
              icon,
              color: context.onSurface,
              size: IconSizes.md,
            ),
          ),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.appTextOld.caption.copyWith(
                    fontWeight: FontWeight.w900,
                    color: context.onSurface,
                  ),
                ),
                const SizedBox(height: SpacingSize.xs),
                Text(
                  subtitle,
                  style: context.appTextOld.caption.copyWith(
                    height: 1.25,
                    fontWeight: FontWeight.w500,
                    color: context.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
