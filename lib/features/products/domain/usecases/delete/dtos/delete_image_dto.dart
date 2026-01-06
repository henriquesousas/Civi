import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:deehelp/features/products/domain/entities/product_id.dart';
import 'package:equatable/equatable.dart';

class DeleteImageDto extends Equatable {
  final ProductId productId;
  final ImageMedia image;

  const DeleteImageDto({
    required this.productId,
    required this.image,
  });

  @override
  List<Object?> get props => [productId, image];
}
