import 'package:deehelp/v2/core/extensions/text_extension.dart';
import 'package:flutter/material.dart';

class TextLastHours extends StatelessWidget {
  const TextLastHours({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Últimas 24h',
        style: context.appText.subtitle.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
