import 'package:deehelp/features/itens/domain/entities/item_id.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';

import '../domain/item_status.dart';

class ItemModel {
  static Map<String, dynamic> toMap(Item item) {
    return {
      'id': item.id,
      'name': item.name,
      'code': item.code,
      'color': item.color,
      'brand': item.brand,
      'obs': item.obs,
      'year': item.year,
      'imageUrl': item.imageUrl,
      'status': item.status.toString(),
      'type': item.type,
      'userId': item.userId,
      'createdAt': item.createdAt?.millisecondsSinceEpoch ??
          DateTime.now().microsecondsSinceEpoch,
    };
  }

  static Item fromMap(Map<String, dynamic> map) {
    return Item(
      id: ItemId.from(map['id']),
      name: map['name'],
      code: map['code'],
      color: map['color'],
      brand: map['brand'],
      obs: map['obs'],
      year: map['year'],
      imageUrl: map['imageUrl'],
      status: ItemStatus.values.firstWhere((e) => e.name == map['status']),
      type: map['type'],
      userId: map['userId'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }
}
