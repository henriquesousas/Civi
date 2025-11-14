import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/domain/item_repository.dart';

import 'item_model.dart';

class RemoteItemRepository implements ItemRepository {
  final FirebaseFirestore firestore;

  RemoteItemRepository({required this.firestore});

  @override
  Future<void> save(Item item) async {
    final data = ItemModel().toMap(item);
    await firestore.collection("products").doc(item.userId).set(data);
  }
}
