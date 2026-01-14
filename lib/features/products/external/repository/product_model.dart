import 'package:deehelp/features/products/domain/entities/product_id.dart';
import 'package:deehelp/features/products/external/repository/image_media_model.dart';

import '../../domain/entities/product.dart';
import '../../product_status.dart';

class ProductModel {
  static Map<String, dynamic> toMap(Product product) {
    return {
      'id': product.id.value,
      'name': product.name,
      'code': product.code,
      'color': product.color,
      'brand': product.brand,
      'obs': product.obs,
      'year': product.year,
      'status': product.status.toString(),
      'type': product.type,
      'user_id': product.userId,
      'created_at': product.createdAt?.toUtc().toIso8601String(),
    };
  }

  static Product fromMap(Map<String, dynamic> map) {
    final images = (map["product_images"] as List)
        .map((e) => ImageMediaModel.fromMap(e))
        .toList();
    return Product(
      id: ProductId.from(map['id']),
      name: map['name'],
      code: map['code'],
      color: map['color'],
      brand: map['brand'],
      obs: map['obs'],
      year: map['year'],
      images: images,
      status: ProducStatus.values.firstWhere((e) => e.name == map['status']),
      type: map['type'],
      userId: map['user_id'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }
}
