import 'package:deehelp/core/extensions/context_extension.dart';
import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/onboarding/components/primary_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../../core/components/buttons/ui_outline_button.dart';
import '../../../core/components/buttons/ui_secondary_button.dart';

class OnboardingBottomSection extends StatelessWidget {
  final String buttonTitle;
  final int currentPage;
  final int totalPage;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  const OnboardingBottomSection(
      {super.key,
      required this.buttonTitle,
      required this.currentPage,
      required this.totalPage,
      required this.onNext,
      required this.onPrevious});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.percentHeight(0.02),
      left: context.percentHeight(0.02),
      right: context.percentHeight(0.02),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrimaryProgressIndicator(
            currentPage: currentPage,
            totalPage: totalPage,
            selectedColor: Colors.white,
            unselectedColor: Colors.white.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Row(
              spacing: 10,
              children: [
                if (currentPage > 0)
                  Expanded(
                    child: UIOutlineButton(
                      text: context.strings.back,
                      borderColor: Colors.white,
                      press: onPrevious,
                      textColor: AppColors.whiteColor,
                    ),
                  ),
                Expanded(
                  child: UISecondaryButton(
                    text: buttonTitle,
                    press: onNext,
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
