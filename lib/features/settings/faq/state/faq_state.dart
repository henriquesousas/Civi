class FaqState {
  final Set<int> expandedIndexes;

  const FaqState({this.expandedIndexes = const {}});

  FaqState copyWith({Set<int>? expandedIndexes}) {
    return FaqState(
      expandedIndexes: expandedIndexes ?? this.expandedIndexes,
    );
  }
}
