enum TypeAlert {
  immediately,
  detailed,
  none,
}

extension TypeAlertExtension on TypeAlert {
  String get label {
    switch (this) {
      case TypeAlert.immediately:
        return 'Imediato';
      case TypeAlert.detailed:
        return 'Detalhado';
      case TypeAlert.none:
        return 'Em análise';
    }
  }
}
