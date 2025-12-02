import 'package:deehelp/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

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
              // color: AppColorsV2.textSecondary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              "${context.strings.otpResendCode} $_formattedCountdown",
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
