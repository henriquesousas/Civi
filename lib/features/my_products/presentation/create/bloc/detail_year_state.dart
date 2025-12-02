class DetailYearState {
  final String? value;
  final String? error;

  DetailYearState({this.value, this.error});

  DetailYearState copyWith({
    String? value,
    String? error,
  }) {
    return DetailYearState(
      value: value ?? this.value,
      error: error,
    );
  }
}
