import 'package:deehelp/module/item/domain/entities/image_media.dart';

class IncidentProductOutput {
  final String productId;
  final String name;
  final String code;
  final String color;
  final String brand;
  final String type;
  final String? obs;
  final List<ImageMedia> images;

  IncidentProductOutput({
    required this.productId,
    required this.name,
    required this.code,
    required this.images,
    required this.color,
    required this.brand,
    required this.type,
    this.obs,
  });
}
