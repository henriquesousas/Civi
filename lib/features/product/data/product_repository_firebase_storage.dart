import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deehelp/features/product/data/product_model.dart';

import '../domain/entities/product.dart';
import '../domain/product_repository.dart';

class ProductRepositoryFirebaseStorage implements ProductRepository {
  final FirebaseFirestore _firestore;

  ProductRepositoryFirebaseStorage({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<void> save(Product item) async {
    final data = ProductModel.toMap(item);
    await _firestore
        .collection("users")
        .doc(item.userId)
        .collection("products")
        .doc(item.id.value)
        .set(data);
  }

  @override
  Future<void> update(Product product) async {
    final data = ProductModel.toMap(product);
    await _firestore
        .collection("users")
        .doc(product.userId)
        .collection("products")
        .doc(product.id.value)
        .update(data);
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

  @override
  Future<List<Product>> getByUser(String userId) async {
    final querySnapshot = await _firestore
        .collection("users")
        .doc(userId)
        .collection("products")
        .get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      return ProductModel.fromMap(data);
    }).toList();
  }
}
