import 'package:flutter/material.dart';

import '../../../core/ui/localization/resources.dart';

class SplashLineIndicator extends StatelessWidget {
  const SplashLineIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 60,
          child: LinearProgressIndicator(
            backgroundColor: Colors.white.withValues(alpha: 0.3),
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white.withValues(alpha: 0.8),
            ),
            minHeight: 3,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          " R.strings.waiting",
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.7),
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
