import 'package:deehelp/core/extension/size_extension.dart';
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
            style: context.appTextOld.caption.copyWith(
              fontWeight: FontWeight.w800,
              color: style.fg,
            ),
          ),
        ],
      ),
    );
  }
}

class StatusBadgeV2 extends StatelessWidget {
  final ItemStatus status;

  const StatusBadgeV2({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    String text;
    Color color;

    switch (status) {
      case ItemStatus.active:
        text = "ATIVO";
        color = const Color(0xFF22C55E);
        break;

      case ItemStatus.rouberry:
        text = "ROUBADO";
        color = const Color(0xFFEF4444);
        break;

      case ItemStatus.pending:
        text = "PENDENTE";
        color = const Color(0xFFF59E0B);
        break;

      case ItemStatus.canceled:
        text = "CANCELADO";
        color = const Color(0xFF6B7280);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color, width: 1.4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: context.safeSp(9),
        ),
      ),
    );
  }
}
