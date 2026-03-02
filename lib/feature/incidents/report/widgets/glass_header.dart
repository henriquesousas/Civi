import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
import 'package:flutter/material.dart';

class GlassHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  const GlassHeader({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HighlightIcon(
          bgColor: Colors.white.withValues(alpha: 0.14),
          icon: Icon(icon, color: Colors.white, size: IconSizes.md),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: context.appText.headersm.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
