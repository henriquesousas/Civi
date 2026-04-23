import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class HeaderSuggestionNickname extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const HeaderSuggestionNickname({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: SizeLayoutSpacing.m, vertical: SizeLayoutSpacing.m),
      child: Row(
        children: [
          UIIconCard(
            width: SizeContainer.m,
            height: SizeContainer.m,
            bgColor: Colors.white,
            icon: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: SizeSpacing.m),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.appText.bodyLarger.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: SizeSpacing.xs),
                Text(
                  subtitle,
                  style: context.appText.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
