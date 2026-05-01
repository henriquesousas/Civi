import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;

  const TitleSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
      child: Text(
        title.toUpperCase(),
        style: context.appText.caption.copyWith(
          fontWeight: FontWeight.w600,
          // color: context.themeColor.secundaryTextColor,
        ),
      ),
    );
  }
}
