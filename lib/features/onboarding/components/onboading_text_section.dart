import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

class OnboardingTextSection extends StatelessWidget {
  final String title;
  final String description;
  const OnboardingTextSection({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: context.textLargeBold.copyWith(
            color: Colors.white,
            height: 1.2,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          style: context.textSmall.copyWith(
            color: Colors.white.withValues(alpha: 0.6),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
