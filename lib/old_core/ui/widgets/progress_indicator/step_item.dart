import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class StepItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isCompleted;

  const StepItem({
    required this.title,
    this.isActive = false,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 10,
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.primaryColor
                  : AppColors.lightGreyColor20,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color:
                      isActive ? AppColors.primaryColor : AppColors.greyColor,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
