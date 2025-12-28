import '../../entities/image_media.dart';

class AddProductDto {
  final String userId;
  final List<ImageMedia> images;
  final String name;
  final String code;
  final int year;
  final String type;
  final String brand;
  final String color;
  final String? obs;

  AddProductDto({
    required this.userId,
    required this.images,
    required this.name,
    required this.code,
    required this.year,
    required this.type,
    required this.brand,
    required this.color,
    required this.obs,
  });
}
