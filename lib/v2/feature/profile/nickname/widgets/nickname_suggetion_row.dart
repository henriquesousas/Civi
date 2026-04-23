import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class NicknameSuggestionRow extends StatelessWidget {
  final String value;
  final VoidCallback onTap;

  const NicknameSuggestionRow({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SizeLayoutSpacing.m,
          vertical: SizeLayoutSpacing.m,
        ),
        child: Row(
          children: [
            const UIIconCard(
              icon: Icon(
                Icons.auto_awesome_rounded,
                size: SizeIcon.m,
                color: Color(0xFFF3F7FF),
              ),
            ),
            const SizedBox(width: SizeSpacing.m),
            Expanded(
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.appText.bodyLarger.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(width: SizeSpacing.m),
            const UIIconCard(
              icon: Icon(
                Icons.check_rounded,
                size: SizeIcon.m,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
