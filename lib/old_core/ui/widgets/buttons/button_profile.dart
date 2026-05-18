import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:flutter/material.dart';

enum ButtonProfileSize { low, medium }

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
          // width: IconSizes.xxl,
          // height: IconSizes.xxl,
          width: ImageSize.md,
          height: ImageSize.md,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.fromBorderSide(BorderSide(
              color: context.outlineVariantColor,
            )),
          ),
          child: ClipOval(
            child: Icon(
              Icons.person_rounded,
              // size: IconSizes.lg,
              size: IconSizes.xxl,
              color: const Color(0xFF667085),
            ),
          ),
        ),
      ),
    );
  }
}
