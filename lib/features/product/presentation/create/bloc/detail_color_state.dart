class DetailColorState {
  final String? color;

  DetailColorState({this.color});

  DetailColorState copyWith({
    String? color,
  }) {
    return DetailColorState(
      color: color,
    );
  }
}
