import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';

class AddImageDto {
  final ImageMedia image;
  final Product product;

  AddImageDto({required this.image, required this.product});
}
