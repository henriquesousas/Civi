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
          bg: const Color(0xFF2B5BEE).withOpacity(0.12),
          fg: const Color(0xFF2B5BEE),
          border: const Color(0xFF2B5BEE).withOpacity(0.35),
          icon: Icons.check_circle_outline,
        );
      case ItemStatus.pending:
        return StatusStyle(
          label: 'Pendente',
          bg: const Color(0xFFFFB020).withOpacity(0.14),
          fg: const Color(0xFFB06A00),
          border: const Color(0xFFFFB020).withOpacity(0.35),
          icon: Icons.schedule,
        );
      case ItemStatus.canceled:
        return StatusStyle(
          label: 'Cancelado',
          bg: Colors.redAccent.withOpacity(0.12),
          fg: Colors.redAccent,
          border: Colors.redAccent.withOpacity(0.30),
          icon: Icons.block,
        );
    }
  }
}
