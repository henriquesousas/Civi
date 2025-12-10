import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/localization/resources.dart';

class SplashBottomSection extends StatelessWidget {
  const SplashBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "R.strings.version 1.0.0",
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.lightGreyColor,
              ),
        ),
      ],
    );
  }
}
