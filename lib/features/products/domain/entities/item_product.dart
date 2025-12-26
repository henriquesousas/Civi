class ItemProduct {
  final String description;
  final String srcImage;
  final bool isSelected;
  final int identifier;

  ItemProduct({
    required this.description,
    required this.srcImage,
    required this.isSelected,
    required this.identifier,
  });

  ItemProduct copyWith({
    String? description,
    String? srcImage,
    bool? isSelected,
  }) {
    return ItemProduct(
      description: description ?? this.description,
      srcImage: srcImage ?? this.srcImage,
      isSelected: isSelected ?? this.isSelected,
      identifier: identifier,
    );
  }
}
