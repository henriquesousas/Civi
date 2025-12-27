import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../domain/product_status.dart';

class StatusBadgeWidget extends StatelessWidget {
  final bool isShimmer;
  final ProductSatus status;

  const StatusBadgeWidget(
      {super.key, required this.status, this.isShimmer = false});

  @override
  Widget build(BuildContext context) {
    final shimmerColor = AppColors.greyColor.withValues(alpha: 0.1);
    final bgColor =
        isShimmer ? shimmerColor : status.color.withValues(alpha: 0.1);
    final borderColor =
        isShimmer ? shimmerColor : status.color.withValues(alpha: 0.3);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            status.icon,
            size: 12,
            color: status.color,
          ),
          const SizedBox(width: 4),
          Text(
            status.label,
            style: context.appTextStyles.caption2Style.copyWith(
              color: status.color,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
