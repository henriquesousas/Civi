import 'package:deehelp/old_core/providers/image_storage_provider.dart';
import 'package:deehelp/old_features/products/domain/usecases/add/add_image_usecase.dart';
import 'package:deehelp/old_features/products/domain/usecases/add/add_product_usecase.dart';
import 'package:deehelp/old_features/products/domain/usecases/delete/delete_image_usecase.dart';
import 'package:deehelp/old_features/products/domain/usecases/delete/delete_product_usecase.dart';
import 'package:deehelp/old_features/products/domain/usecases/listing/get_products_by_user_usecase.dart';
import 'package:deehelp/old_features/products/domain/usecases/update/update_product_usecase.dart';
import 'package:deehelp/old_features/products/presentation/providers/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProductsByUserUsecaseProvider =
    Provider.autoDispose<GetProductsByUserUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetProductsByUserUsecase(repository: repository);
});

final updateProductUsecaseProvider =
    Provider.autoDispose<UpdateProductUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return UpdateProductUseCase(repository: repository);
});

final addProductUsecaseProvider =
    Provider.autoDispose<AddProductUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  final imageStorageService = ref.watch(imageStorageServiceProvider);

  return AddProductUseCase(
    repository: repository,
    imageStorage: imageStorageService,
  );
});

final deleteImageUsecaseProvider =
    Provider.autoDispose<DeleteImageUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  final imageStorageService = ref.watch(imageStorageServiceProvider);

  return DeleteImageUsecase(
    repository: repository,
    imageStorage: imageStorageService,
  );
});

final addImageUsecaseProvider = Provider.autoDispose<AddImageUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  final imageStorageService = ref.watch(imageStorageServiceProvider);

  return AddImageUsecase(
    repository: repository,
    imageStorage: imageStorageService,
  );
});

final deleteProductUsecaseProvider =
    Provider.autoDispose<DeleteProductUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  final imageStorageService = ref.watch(imageStorageServiceProvider);

  return DeleteProductUsecase(
    repository: repository,
    imageStorage: imageStorageService,
  );
});
