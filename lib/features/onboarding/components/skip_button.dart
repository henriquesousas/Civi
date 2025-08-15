import 'package:flutter/material.dart';
import 'package:yousafe/shared/extensions/context_extension.dart';
import 'package:yousafe/shared/extensions/screen_size_extension.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onSkip;
  const SkipButton({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.percentHeight(0.09),
      right: context.percentWidth(0.05),
      child: TextButton(
        // onPressed: _currentPage == _totalPages - 1 ? null : _skipOnboarding,
        onPressed: onSkip,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        child: Text(
          context.strings.jump,
          style: context.getTextStyle.smallMedium.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
