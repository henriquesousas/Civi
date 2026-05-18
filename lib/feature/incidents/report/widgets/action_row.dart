import 'package:deehelp/old_core/theme/size/icon_size.dart';
import 'package:deehelp/old_core/ui/styles/app_text_style.dart';
import 'package:deehelp/old_core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class ActionRow extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool highlight;

  const ActionRow({
    super.key,
    this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final bg = highlight
        ? Colors.white.withValues(alpha: 0.16)
        : Colors.white.withValues(alpha: 0.10);
    final border = highlight
        ? Colors.white.withValues(alpha: 0.22)
        : Colors.white.withValues(alpha: 0.16);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: border),
        ),
        child: Row(
          children: [
            HighlightIcon(
              bgColor: Colors.white.withValues(alpha: 0.14),
              icon: Icon(icon, color: Colors.white, size: IconSizes.md),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.appTextOld.headersm.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: context.appTextOld.headersm.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
            if (onTap != null) ...[
              const Icon(Icons.chevron_right, color: Colors.white),
            ]
          ],
        ),
      ),
    );
  }
}
