import 'package:deehelp/old_features/products/domain/entities/image_media.dart';

class IncidentProductOutput {
  final String productId;
  final String name;
  final String code;
  final List<ImageMedia> images;

  IncidentProductOutput({
    required this.productId,
    required this.name,
    required this.code,
    required this.images,
  });
}
