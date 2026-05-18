import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool showBottomPadding;

  const CardHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.showBottomPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(14, 14, 14, showBottomPadding ? 12 : 0),
      child: Row(
        children: [
          HighlightIcon(
            bgColor: context.primaryColor.withValues(alpha: 0.10),
            icon: Icon(icon, color: context.primaryColor),
          ),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.appText.bodyLarger.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: SpacingSize.xs),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.appText.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
