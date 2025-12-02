class DetailBrandState {
  final String? brand;

  DetailBrandState({this.brand});

  DetailBrandState copyWith({
    String? brand,
  }) {
    return DetailBrandState(
      brand: brand,
    );
  }
}
