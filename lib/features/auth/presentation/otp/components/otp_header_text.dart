import 'package:flutter/material.dart';
import 'package:deehelp/shared/extensions/context_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

import '../../../../../app/theme/app_colors.dart';

class OtpHeaderText extends StatelessWidget {
  final String phoneNumber;
  const OtpHeaderText({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.strings.otpInsertVerificationCode,
          textAlign: TextAlign.center,
          style: context.getTextStyle.medium.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: context.getTextStyle.smallMedium.copyWith(
              color: AppColors.textSecondary,
              height: 2,
              // fontSize: context.responsiveText(0.03),
            ),
            children: [
              TextSpan(
                text: ' ${context.strings.otpWeSentCode}\n',
              ),
              TextSpan(
                text: _maskedPhoneNumber,
                style: context.getTextStyle.smallMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                  // fontSize: context.responsiveText(0.03),
                ),
                // style: const TextStyle(
                //   fontWeight: FontWeight.w600,
                //   color: AppColors.primary,
                // ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String get _maskedPhoneNumber {
    if (phoneNumber.length >= 4) {
      final visible = phoneNumber.substring(
        phoneNumber.length - 4,
      );
      return '****$visible';
    }
    return phoneNumber;
  }
}
