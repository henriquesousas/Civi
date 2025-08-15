import 'package:flutter/material.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

import '../../../../app/theme/app_colors.dart';

class RegisterAccountHeaderTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const RegisterAccountHeaderTitle(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.getTextStyle.mediumLarge.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: context.getTextStyle.regular.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
