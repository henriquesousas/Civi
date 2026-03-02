import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/module/item/domain/entities/product_id.dart';

import 'entities/product.dart';

abstract class ProductRepository {
  Future<void> save(Product product);
  Future<void> update(Product product);
  Future<void> delete(ProductId id);
  Future<Product?> getByCode(String code);
  Future<List<Product>> getAll(String userId);
  //TODO: Colocar em um repositorio separado
  Future<void> saveImage(ProductId productId, ImageMedia image);
  Future<void> deleteImage(ImageMedia image);
}
