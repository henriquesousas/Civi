import 'package:deehelp/core/services/media/r2_cloudflare_media_storage.dart';
import 'package:deehelp/core/ui/constants.dart';
import 'package:deehelp/features/products/domain/usecases/add_product_usecase.dart';
import 'package:deehelp/features/products/domain/usecases/get_products_by_user_usecase.dart';
import 'package:deehelp/features/products/presentation/providers/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProductsByUserUsecaseProvider =
    Provider.autoDispose<GetProductsByUserUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetProductsByUserUsecase(repository: repository);
});

final addProductUsecaseProvider =
    Provider.autoDispose<AddProductUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return AddProductUseCase(
    repository: repository,
    media: R2CloudFlareMediaStorage(),
    bucket: Constants.imageBucket,
    imageName:
        'products/${DateTime.now().millisecondsSinceEpoch.toString()}.${"jpeg"}',
  );
});
