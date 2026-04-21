import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class FaqSectionTitle extends StatelessWidget {
  final String text;
  const FaqSectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 10),
      child: Text(
        text.toUpperCase(),
        style: context.appTextOld.caption.copyWith(
          fontWeight: FontWeight.w600,
          color: const Color(0xFF8A96C8),
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
