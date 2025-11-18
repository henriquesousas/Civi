import 'package:flutter/material.dart';

enum ItemStatus {
  active("active"),
  inactive("inactive"),
  pending("pending");

  const ItemStatus(this.value);
  final String value;

  @override
  String toString() => value;

  Color get color {
    switch (this) {
      case ItemStatus.active:
        return const Color(0xFF10B981);
      case ItemStatus.pending:
        return const Color(0xFFF59E0B);
      case ItemStatus.inactive:
        return const Color(0xFFEF4444);
    }
  }

  IconData get icon {
    switch (this) {
      case ItemStatus.active:
        return Icons.check_circle;
      case ItemStatus.pending:
        return Icons.pending;
      case ItemStatus.inactive:
        return Icons.cancel;
    }
  }

  String get label {
    switch (this) {
      case ItemStatus.active:
        return 'Ativo';
      case ItemStatus.pending:
        return 'Pendente';
      case ItemStatus.inactive:
        return 'Inativo';
    }
  }
}
