import 'package:flutter/material.dart';

enum ProducStatus {
  active("active"),
  inactive("inactive"),
  pending("pending");

  const ProducStatus(this.value);
  final String value;

  @override
  String toString() => value;

  Color get color {
    switch (this) {
      case ProducStatus.active:
        return const Color(0xFF10B981);
      case ProducStatus.pending:
        return const Color(0xFFF59E0B);
      case ProducStatus.inactive:
        return const Color(0xFFEF4444);
    }
  }

  IconData get icon {
    switch (this) {
      case ProducStatus.active:
        return Icons.check_circle;
      case ProducStatus.pending:
        return Icons.pending;
      case ProducStatus.inactive:
        return Icons.cancel;
    }
  }

  String get label {
    switch (this) {
      case ProducStatus.active:
        return 'Ativo';
      case ProducStatus.pending:
        return 'Pendente';
      case ProducStatus.inactive:
        return 'Inativo';
    }
  }
}
