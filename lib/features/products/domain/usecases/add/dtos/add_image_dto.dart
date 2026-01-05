import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';

class AddImageDto {
  final ImageMedia image;
  final Product product;

  AddImageDto({required this.image, required this.product});
}
