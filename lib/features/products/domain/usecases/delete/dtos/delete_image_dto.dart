import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:deehelp/features/products/domain/entities/product_id.dart';

class DeleteImageDto {
  final ProductId productId;
  final ImageMedia image;

  DeleteImageDto({
    required this.productId,
    required this.image,
  });
}
