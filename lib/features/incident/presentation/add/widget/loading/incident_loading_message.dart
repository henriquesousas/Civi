import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentLoadingMessage extends StatelessWidget {
  final String message;
  final String dots;
  const IncidentLoadingMessage(
      {super.key, required this.message, required this.dots});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          message,
          style: TextStyle(
            fontSize: Dimens.size20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 4,
                color: Colors.black.withValues(alpha: 0.3),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          dots,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w300,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
