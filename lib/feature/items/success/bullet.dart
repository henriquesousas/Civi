import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
import 'package:flutter/material.dart';

class Bullet extends StatelessWidget {
  final String text;
  const Bullet({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HighlightIcon(
            containerSize: IconSizes.sm,
            bgColor: Colors.white.withValues(alpha: 0.18),
            icon: Icon(Icons.check, color: Colors.white, size: IconSizes.xxs),
          ),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Text(
              text,
              style: context.appTextOld.caption.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
