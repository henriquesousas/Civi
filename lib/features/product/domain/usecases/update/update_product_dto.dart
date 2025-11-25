import '../../entities/image_media.dart';

//TODO: Falta alterar o ano
class UpdateProductDto {
  final String productId;
  final String userId;
  final ImageMedia image;
  final String name;
  final String code;
  final int year;
  final String type;
  final String brand;
  final String color;
  final String? obs;

  UpdateProductDto({
    required this.productId,
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
