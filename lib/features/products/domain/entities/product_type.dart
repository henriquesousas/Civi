class ProductType {
  final String description;
  final String srcImage;
  final bool isSelected;
  final int identifier;

  ProductType({
    required this.description,
    required this.srcImage,
    required this.isSelected,
    required this.identifier,
  });

  ProductType copyWith({
    String? description,
    String? srcImage,
    bool? isSelected,
  }) {
    return ProductType(
      description: description ?? this.description,
      srcImage: srcImage ?? this.srcImage,
      isSelected: isSelected ?? this.isSelected,
      identifier: identifier,
    );
  }
}
