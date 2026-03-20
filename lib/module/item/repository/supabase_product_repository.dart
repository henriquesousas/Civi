import 'package:deehelp/module/item/domain/entities/product_id.dart';
import 'package:deehelp/module/item/domain/exceptions/add_product_failure.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/module/item/domain/exceptions/delete_product_failure.dart';
import 'package:deehelp/module/item/domain/product_repository.dart';
import 'package:deehelp/module/item/repository/image_media_model.dart';
import 'package:deehelp/module/item/repository/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseProductRepository implements ProductRepository {
  final product = "product";
  final productImage = "product_images";

  final SupabaseClient _supabaseClient;

  SupabaseProductRepository({required SupabaseClient client})
      : _supabaseClient = client;

  @override
  Future<void> save(Product product) async {
    final map = ProductModel.toMap(product);
    final images = ImageMediaModel.toListMap(product.images);

    final response = await _supabaseClient
        .rpc("add_product_with_image_transaction", params: {
      'product_data': map,
      'imagens': images,
    });
    if (!response["status"]) {
      throw const AddProductFailure();
    }
  }

  @override
  Future<List<Product>> getAll(String userId) async {
    final data = await _supabaseClient
        .from(product)
        .select("*,product_images (*)")
        .eq(
          "user_id",
          userId,
        )
        .order("created_at");
    return data.isNotEmpty
        ? data.map((el) => ProductModel.fromMap(el)).toList()
        : [];
  }

  @override
  Future<Product?> getByCode(String code) async {
    try {
      final data = await _supabaseClient
          .from(product)
          .select("*,product_images (*)")
          .eq("code", code)
          .single();

      return ProductModel.fromMap(data);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> delete(ProductId id) async {
    final response = await _supabaseClient.rpc(
      "remove_product_with_images_transaction",
      params: {
        'p_product_id': id.value,
      },
    );
    if (!response["status"]) {
      throw const DeleteProductFailure();
    }
  }

  @override
  Future<void> update(Product product) async {
    final productMap = ProductModel.toMap(product);
    await _supabaseClient
        .from(this.product)
        .update(productMap)
        .eq("id", product.id.value);
  }

  @override
  Future<void> deleteImage(ImageMedia image) async {
    await _supabaseClient.from(productImage).delete().eq(
          "image_name",
          image.imageName,
        );
  }

  @override
  Future<void> saveImage(ProductId productId, ImageMedia image) async {
    final map = {
      ...ImageMediaModel.toMap(image),
      "product_id": productId.value,
    };
    await _supabaseClient.from(productImage).insert(map);
  }
}
