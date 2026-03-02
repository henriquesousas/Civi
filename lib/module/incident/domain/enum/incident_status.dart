import 'package:flutter/material.dart';

enum IncidentStatus { pending, canceled, analyzing, active, resolved, paused }

extension IncidentStatusExtension on IncidentStatus {
  String get label {
    switch (this) {
      case IncidentStatus.pending:
        return 'Pendente';
      case IncidentStatus.canceled:
        return 'Cancelado';
      case IncidentStatus.analyzing:
        return 'Em análise';
      case IncidentStatus.active:
        return 'Ativo';
      case IncidentStatus.resolved:
        return 'Resolvido';
      case IncidentStatus.paused:
        return 'Pausado';
    }
  }

  Color get color {
    switch (this) {
      case IncidentStatus.pending:
        return const Color(0xFFF59E0B); // Laranja
      case IncidentStatus.canceled:
        return const Color(0xFFEF4444); // Vermelho
      case IncidentStatus.analyzing:
        return const Color(0xFF3B82F6); // Azul
      case IncidentStatus.active:
        return const Color(0xFF10B981); // Verde
      case IncidentStatus.resolved:
        return const Color(0xFF8B5CF6); // Roxo
      case IncidentStatus.paused:
        return const Color(0xFF6B7280); // Cinza
    }
  }

  IconData get icon {
    switch (this) {
      case IncidentStatus.pending:
        return Icons.pending;
      case IncidentStatus.canceled:
        return Icons.cancel;
      case IncidentStatus.analyzing:
        return Icons.search;
      case IncidentStatus.active:
        return Icons.check_circle;
      case IncidentStatus.resolved:
        return Icons.check_circle;
      case IncidentStatus.paused:
        return Icons.pause_circle;
    }
  }

  // Se precisar do valor string (igual ao ProductStatus)
  String get value {
    return name;
  }
}
