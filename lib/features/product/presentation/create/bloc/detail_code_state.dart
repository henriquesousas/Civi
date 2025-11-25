class DetailCodeState {
  final String? code;
  final String? error;

  DetailCodeState({this.code, this.error});

  DetailCodeState copyWith({
    String? code,
    String? error,
  }) {
    return DetailCodeState(
      code: code ?? this.code,
      error: error,
    );
  }
}
