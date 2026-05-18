import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  final String label;
  final Color bg;
  final Color fg;

  const Pill(
      {super.key, required this.label, required this.bg, required this.fg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingSize.md,
        vertical: SpacingSize.md,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(RadiusSize.sm),
      ),
      child: Text(
        label,
        style: context.appTextOld.caption.copyWith(
          color: fg,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.3,
          fontSize: context.safeSp(10),
        ),
      ),
    );
  }
}
