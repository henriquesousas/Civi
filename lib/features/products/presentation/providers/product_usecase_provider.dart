import 'package:deehelp/core/env.dart';
import 'package:deehelp/core/services/media/r2_cloudflare_image_upload.dart';
import 'package:deehelp/features/auth/presentation/session/session_provider.dart';

import 'package:deehelp/features/products/domain/usecases/add/add_product_usecase.dart';
import 'package:deehelp/features/products/domain/usecases/listing/get_products_by_user_usecase.dart';
import 'package:deehelp/features/products/domain/usecases/update/update_product_usecase.dart';
import 'package:deehelp/features/products/presentation/providers/product_repository_provider.dart';
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
  final authenticatedUser = ref.watch(userSessionProvider);

  return AddProductUseCase(
    repository: repository,
    imageUpload: R2CloudFlareImageUpload(
      bucketName: "deehelp",
      baseFolder: "products/${authenticatedUser!.id}",
      cdnUrl: Env.r2BaseUrl,
    ),
  );
});
