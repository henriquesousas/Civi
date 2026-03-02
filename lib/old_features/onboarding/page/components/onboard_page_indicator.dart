import 'package:flutter/material.dart';

import '../../../../old_core/ui/theme/app_colors.dart';

class OnboardPageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPage;
  const OnboardPageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPage,
        (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            margin: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            width: currentPage == index ? 32 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: currentPage == index
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          );
        },
      ),
    );
  }
}
