import 'package:deehelp/features/products/domain/usecases/get_products_by_user_usecase.dart';
import 'package:deehelp/features/products/presentation/providers/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProductsByUserUsecaseProvider =
    Provider.autoDispose<GetProductsByUserUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetProductsByUserUsecase(repository: repository);
});
