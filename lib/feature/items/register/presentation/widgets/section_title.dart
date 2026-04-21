import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 10),
      child: Text(
        text.toUpperCase(),
        style: context.appTextOld.headersm.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
          color: context.secondaryTextColor,
        ),
      ),
    );
  }
}
