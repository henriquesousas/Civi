import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ErrorMessageIndicator extends StatelessWidget {
  final String error;
  const ErrorMessageIndicator({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        error,
        textAlign: TextAlign.center,
        style: context.appTextStyles.bodyTextStyle1.copyWith(
          color: Colors.white.withValues(alpha: 0.95),
          height: 1.6,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
