import 'package:flutter/material.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

import '../../../../app/theme/app_colors.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;
  const Header({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.getTextStyle.regularMedium.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: context.responsiveText(0.045)),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: context.getTextStyle.small.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
