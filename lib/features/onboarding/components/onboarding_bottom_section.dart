import 'package:flutter/material.dart';
import 'package:yousafe/shared/components/buttons/secondary_button.dart';
import 'package:yousafe/shared/components/buttons/secondary_outline_button.dart';
import 'package:yousafe/shared/components/indicator/primary_progress_indicator.dart';
import 'package:yousafe/shared/extensions/context_extension.dart';
import 'package:yousafe/shared/extensions/screen_size_extension.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

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
          Row(
            spacing: 10,
            children: [
              if (currentPage > 0)
                Expanded(
                  child: SecondaryOutlineButton(
                    text: context.strings.back,
                    textStyle: context.getTextStyle.regular,
                    foregroundColor: Colors.white,
                    borderColor: Colors.white,
                    onPressed: onPrevious,
                  ),
                ),
              Expanded(
                child: SecondaryButton(
                  text: buttonTitle,
                  textStyle: context.getTextStyle.regular,
                  onPressed: onNext,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
