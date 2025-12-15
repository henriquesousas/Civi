import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class UIBadgeWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  const UIBadgeWidget(
      {super.key, required this.text, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.2), width: 0.8),
      ),
      child: Row(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(
          //   icon,
          //   size: 12,
          //   color: color,
          // ),
          Text(
            text,
            style: context.appTextStyles.caption1Style.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
