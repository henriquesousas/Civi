import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/resources.dart';
import '../../../core/theme/app_colors.dart';

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
          color: AppColors.primaryColor.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: onSkip,
          child: Text(
            R.strings.skip,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ),
    );
  }
}
