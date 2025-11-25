import '../../entities/image_media.dart';

class CreateProductDto {
  final String userId;
  final ImageMedia image;
  final String name;
  final String code;
  final int year;
  final String type;
  final String brand;
  final String color;
  final String? obs;

  CreateProductDto({
    required this.userId,
    required this.image,
    required this.name,
    required this.code,
    required this.year,
    required this.type,
    required this.brand,
    required this.color,
    required this.obs,
  });
}
