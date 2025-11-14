import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deehelp/features/itens/data/item_datasource.dart';
import 'package:deehelp/features/itens/data/item_model.dart';
import 'package:deehelp/features/itens/domain/item_exception.dart';

import '../domain/entities/my_items.dart';

class FirebaseStorageItemDatasource implements ItemDataSource {
  final FirebaseFirestore firestore;

  FirebaseStorageItemDatasource({required this.firestore});

  @override
  Future<void> save(Item item) async {
    try {
      final data = ItemModel().toMap(item);
      await firestore.collection("products").doc(item.userId).set(data);
    } catch (e) {
      throw ItemException(message: e.toString());
    }
  }
}
