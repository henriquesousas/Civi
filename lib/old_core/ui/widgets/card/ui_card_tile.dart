import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class UICardTile extends StatelessWidget {
  final String label;
  final Color color;
  const UICardTile({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(
          //   iconData,
          //   size: Dimens.size12.w,
          //   color: color,
          // ),
          const SizedBox(width: 4),
          Text(
            label,
            style: context.appTextStyles.caption2Style.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
