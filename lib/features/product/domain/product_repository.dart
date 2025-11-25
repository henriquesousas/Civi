import 'entities/product.dart';

abstract class ProductRepository {
  Future<void> save(Product product);
  Future<void> update(Product product);
  Future<void> delete(String itemId, String userId);
  Future<List<Product>> getByUser(String userId);
}
