import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class CounterBadge extends StatelessWidget {
  final int currentIndex;
  final int length;
  const CounterBadge(
      {super.key, required this.currentIndex, required this.length});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: .55),
        borderRadius: BorderRadius.circular(SizeLayoutSpacing.m),
      ),
      child: Text(
        '$currentIndex/$length',
        style: context.appText.subtitle.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
