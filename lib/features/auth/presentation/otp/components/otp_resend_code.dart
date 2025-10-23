import 'package:flutter/material.dart';
import 'package:yousafe/shared/extensions/context_extension.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

import '../../../../../app/theme/app_colors.dart';

class OtpResendCode extends StatelessWidget {
  const OtpResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.timer_outlined,
              color: AppColors.textSecondary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              "${context.strings.otpResendCode} $_formattedCountdown",
              style: context.getTextStyle.smallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String get _formattedCountdown {
    final int countdown = 5 * 60;
    final minutes = (countdown ~/ 60).toString().padLeft(2, '0');
    final seconds = (countdown % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
