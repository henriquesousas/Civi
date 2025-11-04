import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/resources.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onSkip;
  const SkipButton({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.percentHeight(0.09),
      right: context.percentWidth(0.05),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryDark.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          // onPressed: _currentPage == _totalPages - 1 ? null : _skipOnboarding,
          onPressed: onSkip,
          child: Text(
            R.strings.skip,
            style: context.textSmallMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
