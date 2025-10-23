import 'package:flutter/material.dart';
import 'package:yousafe/shared/components/icons/primary_icon.dart';
import 'package:yousafe/shared/extensions/context_extension.dart';
import 'package:yousafe/shared/extensions/screen_size_extension.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

import '../../../../../app/theme/app_colors.dart';

class LoginWelcomeSection extends StatelessWidget {
  const LoginWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PrimaryIcon(
          icon: Icon(
            Icons.directions_car_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          context.strings.loginTitle,
          style: context.getTextStyle.regularMedium.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: context.responsiveText(0.045)),
        ),
        const SizedBox(height: 10),
        Text(
          context.strings.loginSubtitle,
          style: context.getTextStyle.smallMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
