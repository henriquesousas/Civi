import 'package:deehelp/features/products/domain/add_product_failure.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/domain/product_repository.dart';
import 'package:deehelp/features/products/external/repository/image_media_model.dart';
import 'package:deehelp/features/products/external/repository/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseProductRepository implements ProductRepository {
  final table = "product";

  final SupabaseClient _client;

  SupabaseProductRepository({required SupabaseClient client})
      : _client = client;

  @override
  Future<void> save(Product product) async {
    final map = ProductModel.toMap(product);
    final images = ImageMediaModel.toMap(product.images);

    final response =
        await _client.rpc("add_product_with_image_transaction", params: {
      'product_data': map,
      'imagens': images,
    });
    if (!response["status"]) {
      throw const AddProductFailure();
    }
  }

  @override
  Future<List<Product>> getByUser(String userId) async {
    final data = await _client.from(table).select("*,product_images (*)").eq(
          "user_id",
          userId,
        );
    return data.isNotEmpty
        ? data.map((el) => ProductModel.fromMap(el)).toList()
        : [];
  }

  @override
  Future<void> delete(String itemId, String userId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> update(Product product) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
