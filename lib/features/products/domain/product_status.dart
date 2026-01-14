import 'package:flutter/material.dart';

//TODO: deve virar um status compartilhado
enum ProductSatus {
  active("active"),
  inactive("inactive"),
  pending("pending");

  const ProductSatus(this.value);
  final String value;

  @override
  String toString() => value;

  Color get color {
    switch (this) {
      case ProductSatus.active:
        return const Color(0xFF10B981);
      case ProductSatus.pending:
        return const Color(0xFFF59E0B);
      case ProductSatus.inactive:
        return const Color(0xFFEF4444);
    }
  }

  IconData get icon {
    switch (this) {
      case ProductSatus.active:
        return Icons.check_circle;
      case ProductSatus.pending:
        return Icons.pending;
      case ProductSatus.inactive:
        return Icons.cancel;
    }
  }

  String get label {
    switch (this) {
      case ProductSatus.active:
        return 'Ativo';
      case ProductSatus.pending:
        return 'Pendente';
      case ProductSatus.inactive:
        return 'Inativo';
    }
  }
}
