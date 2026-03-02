import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class ButtonProfile extends StatelessWidget {
  final VoidCallback onTap;

  const ButtonProfile({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Ink(
          width: IconSizes.xxl,
          height: IconSizes.xxl,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.fromBorderSide(BorderSide(
              color: context.outlineVariantColor,
            )),
          ),
          child: ClipOval(
            child: Icon(
              Icons.person_rounded,
              size: IconSizes.lg,
              color: const Color(0xFF667085),
            ),
          ),
        ),
      ),
    );
  }
}
