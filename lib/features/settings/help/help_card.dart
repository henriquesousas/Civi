import 'package:flutter/material.dart';
import 'package:deehelp/features/settings/help/help_options.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

import '../../../app/theme/app_colors.dart';

class HelpCard extends StatelessWidget {
  final HelpOptions helpOption;
  const HelpCard({super.key, required this.helpOption});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // border: Border.all(
        //   color: helpOption.isAvailable
        //       ? helpOption.color.withValues(alpha: 0.3)
        //       : AppColors.border,
        // ),
        border: Border.all(
          color: AppColors.borderDark,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: const Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: helpOption.color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              helpOption.icon,
              color: helpOption.isAvailable
                  ? helpOption.color
                  : AppColors.textTertiary,
              size: 24,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            helpOption.title,
            style: context.getTextStyle.mediumSmall.copyWith(
              color: helpOption.isAvailable
                  ? AppColors.textPrimary
                  : AppColors.textTertiary,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            helpOption.subtitle,
            style: context.getTextStyle.small
                .copyWith(color: AppColors.textSecondary, fontSize: 11),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: helpOption.color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              helpOption.estimatedWait,
              style: context.getTextStyle.small.copyWith(
                color: helpOption.color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
