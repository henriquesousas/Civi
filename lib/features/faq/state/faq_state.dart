class FaqState {
  final int index;
  final Set<int> expandedIndexes;

  const FaqState({
    this.index = 0,
    this.expandedIndexes = const {},
  });

  FaqState copyWith({
    Set<int>? expandedIndexes,
    int? index,
  }) {
    return FaqState(
      expandedIndexes: expandedIndexes ?? this.expandedIndexes,
      index: index ?? this.index,
    );
  }
}
