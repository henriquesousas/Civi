import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:flutter/material.dart';

class TextRipple extends StatelessWidget {
  final String text;
  const TextRipple({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          // ação
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
          child: Text(
            text,
            style: context.appText.caption.copyWith(
              fontWeight: FontWeight.w500,
              color: context.themeColor.secundaryTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
