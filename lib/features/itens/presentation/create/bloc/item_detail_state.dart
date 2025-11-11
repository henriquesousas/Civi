class ItemDetailState {
  final String? code;
  final String? brand;
  final String? color;
  final String? error;

  ItemDetailState(
      {required this.code,
      required this.brand,
      required this.color,
      required this.error});

  ItemDetailState copyWith({
    String? code,
    String? brand,
    String? color,
    String? error,
  }) {
    return ItemDetailState(
      code: code ?? this.code,
      brand: brand ?? this.brand,
      color: color ?? this.color,
      error: error,
    );
  }

  ItemDetailState updateCode(String code, String? error) {
    return copyWith(
      code: code,
      brand: brand,
      color: color,
    );
  }
}
