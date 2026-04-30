import 'package:deehelp/v2/core/extensions/text_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/feature/feed/presentation/widgets/text_last_hours.dart';
import 'package:flutter/material.dart';

class SilverAppTitle extends StatelessWidget {
  const SilverAppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        const Icon(Icons.public, color: Colors.white, size: SizeIcon.m),
        Expanded(
          child: Text(
            'Osasco',
            style: context.appText.title.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const TextLastHours()
      ],
    );
  }
}
