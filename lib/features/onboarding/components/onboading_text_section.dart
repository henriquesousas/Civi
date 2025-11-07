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
      spacing: 10,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.8),
                height: 1.6,
                fontWeight: FontWeight.normal,
              ),
        ),
      ],
    );
  }
}
