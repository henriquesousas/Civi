import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
import 'package:flutter/widgets.dart';

class StatusBadge extends StatelessWidget {
  final StatusStyle style;

  const StatusBadge({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingSize.sm,
        vertical: SpacingSize.xs,
      ),
      decoration: BoxDecoration(
        color: style.bg,
        borderRadius: BorderRadius.circular(RadiusSize.xxl),
        border: Border.all(color: style.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(style.icon, size: IconSizes.xs, color: style.fg),
          const SizedBox(width: 4),
          Text(
            style.label,
            style: context.appText.caption.copyWith(
              fontWeight: FontWeight.w800,
              color: style.fg,
            ),
          ),
        ],
      ),
    );
  }
}
