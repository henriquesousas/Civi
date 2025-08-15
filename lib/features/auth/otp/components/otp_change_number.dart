import 'package:flutter/material.dart';
import 'package:yousafe/shared/extensions/context_extension.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

import '../../../../app/theme/app_colors.dart';

class OtpChangeNumber extends StatelessWidget {
  const OtpChangeNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.edit_outlined,
            color: AppColors.textSecondary,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            context.strings.otpChangePhoneNumber,
            style: context.getTextStyle.smallMedium.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
