import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/domain/item_repository.dart';

import 'item_model.dart';

class ItemRepositoryFirebaseStorage implements ItemRepository {
  final FirebaseFirestore _firestore;

  ItemRepositoryFirebaseStorage({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<void> save(Item item) async {
    final data = ItemModel.toMap(item);
    await _firestore
        .collection("users")
        .doc(item.userId)
        .collection("products")
        .doc(item.id)
        .set(data);
  }

  @override
  Future<List<Item>> getByUser(String userId) async {
    {
      final querySnapshot = await _firestore
          .collection("users")
          .doc(userId)
          .collection("products")
          .get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return ItemModel.fromMap(data);
      }).toList();
    }
  }

  @override
  Future<void> delete(String itemId, String userId) async {
    await _firestore
        .collection("users")
        .doc(userId)
        .collection("products")
        .doc(itemId)
        .delete();
  }
}
