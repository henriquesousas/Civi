import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/cupertino.dart';

import '../../../app/theme/app_colors_v2.dart';

class SwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final Function(bool) onChanged;
  const SwitchTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColorsV2.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColorsV2.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.getTextStyle.smallMedium.copyWith(
                    color: AppColorsV2.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: context.getTextStyle.small.copyWith(
                    color: AppColorsV2.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppColorsV2.primary,
            // activeColor: AppColors.primary,
            // thumbColor: Colors.green.shade900,
            // activeTrackColor: AppColors.primary.withValues(alpha: 0.3),
            inactiveThumbColor: AppColorsV2.textTertiary,
            inactiveTrackColor: AppColorsV2.border,
          )
        ],
      ),
    );
  }
}
