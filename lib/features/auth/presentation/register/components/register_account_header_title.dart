import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors_v2.dart';

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
          style: context.getTextStyle.regularMedium.copyWith(
              color: AppColorsV2.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: context.responsiveText(0.045)),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: context.getTextStyle.regular.copyWith(
            color: AppColorsV2.textSecondary,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
