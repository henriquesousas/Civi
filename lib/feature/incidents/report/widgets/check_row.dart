import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class CheckRow extends StatelessWidget {
  final String text;
  const CheckRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HighlightIcon(
            containerSize: IconContainerSizes.xs,
            bgColor: Colors.white.withValues(alpha: 0.16),
            icon: Icon(Icons.check, color: Colors.white, size: IconSizes.sm),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: context.appText.bodySmall.copyWith(
                color: Colors.white.withValues(alpha: 0.92),
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
