import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/core/utils/result.dart';

import '../entities/product.dart';
import '../product_repository.dart';

class GetProductsByUserUsecase extends UseCase<String, List<Product>> {
  final ProductRepository _repository;

  GetProductsByUserUsecase({required ProductRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<Product>>> execute(String userId) async {
    final products = await _repository.getByUser(userId);
    return Result.success(products);
  }
}
