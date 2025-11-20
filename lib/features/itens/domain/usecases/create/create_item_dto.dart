class CreateItemDto {
  final String userId;
  final String imageUrl;
  final String name;
  final String code;
  final int year;
  final String type;
  final String brand;
  final String color;
  final String? obs;

  CreateItemDto({
    required this.userId,
    required this.imageUrl,
    required this.name,
    required this.code,
    required this.year,
    required this.type,
    required this.brand,
    required this.color,
    required this.obs,
  });
}
