import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class BoxSummaryHeader extends StatelessWidget {
  final String title;
  const BoxSummaryHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.edit,
            color: AppColors.primaryColor,
            size: 16,
          ),
        ),
      ],
    );
    ;
  }
}
