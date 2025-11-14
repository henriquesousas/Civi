import 'package:deehelp/features/itens/domain/entities/my_items.dart';

class ItemModel {
  Map<String, dynamic> toMap(Item item) {
    return {
      'id': item.id,
      'name': item.name,
      'code': item.code,
      'year': item.year,
      'imageUrl': item.imageUrl,
      'status': item.status,
      'type': item.status,
      'userId': item.userId,
      'createdAt': item.createdAt.millisecondsSinceEpoch,
    };
  }

  // factory Item.fromMap(Map<String, dynamic> map) {
  //   return Item(
  //     id: map['id'],
  //     itemName: map['itemName'],
  //     code: map['code'],
  //     year: map['year'],
  //     imageUrl: map['imageUrl'],
  //     status: ItemStatus.values.firstWhere((e) => e.name == map['status']),
  //     itemType: map['itemType'],
  //     userId: map['userId'],
  //     createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
  //     updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt']),
  //   );
  // }
}
