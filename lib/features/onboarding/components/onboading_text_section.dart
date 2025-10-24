import 'package:flutter/material.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

class OnboardingTextSection extends StatelessWidget {
  final String title;
  final String description;
  const OnboardingTextSection(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          // style: context.getTextStyle.medium.copyWith(
          //   color: Colors.white,
          //   fontWeight: FontWeight.bold,
          //   height: 1.2,
          // ),
          // textAlign: TextAlign.center,
          style: context.getTextStyle.regularMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.2,
              fontSize: context.responsiveText(0.06)),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          style: context.getTextStyle.smallMedium.copyWith(
            color: Colors.white.withValues(alpha: 0.9),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
