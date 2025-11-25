import '../domain/entities/image_media.dart';
import '../domain/entities/product.dart';
import '../domain/entities/product_id.dart';
import '../domain/product_status.dart';

class ProductModel {
  static Map<String, dynamic> toMap(Product item) {
    return {
      'id': item.id.value,
      'name': item.name,
      'code': item.code,
      'color': item.color,
      'brand': item.brand,
      'obs': item.obs,
      'year': item.year,
      'imageUrl': item.image?.file.path,
      'status': item.status.toString(),
      'type': item.type,
      'userId': item.userId,
      'createdAt': item.createdAt?.millisecondsSinceEpoch ??
          DateTime.now().microsecondsSinceEpoch,
    };
  }

  static Product fromMap(Map<String, dynamic> map) {
    return Product(
      id: ProductId.from(map['id']),
      name: map['name'],
      code: map['code'],
      color: map['color'],
      brand: map['brand'],
      obs: map['obs'],
      year: map['year'],
      image: ImageMedia.fromWeb(url: map['imageUrl'], metadata: {}),
      status: ProductSatus.values.firstWhere((e) => e.name == map['status']),
      type: map['type'],
      userId: map['userId'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }
}
