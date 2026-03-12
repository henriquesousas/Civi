import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

enum ItemStatus { active, pending, canceled }

class StatusStyle {
  final String label;
  final Color bg;
  final Color fg;
  final Color border;
  final IconData icon;

  const StatusStyle({
    required this.label,
    required this.bg,
    required this.fg,
    required this.border,
    required this.icon,
  });

  factory StatusStyle.from(ItemStatus status) {
    switch (status) {
      case ItemStatus.active:
        return StatusStyle(
          label: 'Ativo',
          bg: AppColors.green.withValues(alpha: 0.12),
          fg: AppColors.green,
          border: AppColors.green.withValues(alpha: 0.35),
          icon: Icons.check_circle_outline,
        );
      case ItemStatus.pending:
        return StatusStyle(
          label: 'Pendente',
          bg: AppColors.orange.withValues(alpha: 0.14),
          fg: AppColors.orange,
          border: AppColors.orange.withValues(alpha: 0.35),
          icon: Icons.schedule,
        );
      case ItemStatus.canceled:
        return StatusStyle(
          label: 'Cancelado',
          bg: Colors.redAccent.withValues(alpha: 0.12),
          fg: Colors.redAccent,
          border: Colors.redAccent.withValues(alpha: 0.30),
          icon: Icons.block,
        );
    }
  }
}
