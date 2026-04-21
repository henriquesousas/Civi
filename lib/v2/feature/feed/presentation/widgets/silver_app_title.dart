import 'package:deehelp/v2/core/extensions/text_extension.dart';
import 'package:deehelp/v2/feature/feed/presentation/widgets/text_last_hours.dart';
import 'package:flutter/material.dart';

class SilverAppTitle extends StatelessWidget {
  const SilverAppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.public, color: Colors.white, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            'Osasco',
            style: context.appText.header,
          ),
        ),
        const TextLastHours()
      ],
    );
  }
}
