class PasswordState {
  final String? value;
  final String? error;
  final bool obscureText;

  const PasswordState({
    this.value,
    this.error,
    this.obscureText = true,
  });

  PasswordState copyWith({
    String? value,
    String? error,
    bool? obscureText,
  }) {
    return PasswordState(
      value: value ?? this.value,
      obscureText: obscureText ?? this.obscureText,
      error: error,
    );
  }

  // bool get isValid => error == null && (value == null);
  bool get hasError => error == null;
}
