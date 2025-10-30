class EmailState {
  final String value;
  final String? error;

  const EmailState({
    this.value = '',
    this.error,
  });

  EmailState copyWith({
    String? value,
    String? error,
  }) {
    return EmailState(
      value: value ?? this.value,
      error: error,
    );
  }

  // bool get isValid => error == null && value.isNotEmpty;
  bool get hasError => error == null;
}
