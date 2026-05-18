import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class VerificationIconBadge extends StatelessWidget {
  const VerificationIconBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Color(0xFF3DDC84),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.verified_rounded,
        size: SizeIcon.m,
        color: Colors.black,
      ),
    );
  }
}
