import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/old_core/utils/result.dart';

import '../../entities/product.dart';
import '../../product_repository.dart';

class GetProductsByUserUsecase extends OLDUseCase<String, List<Product>> {
  final ProductRepository _repository;

  GetProductsByUserUsecase({required ProductRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<Product>>> execute(String userId) async {
    final products = await _repository.getAll(userId);
    return Result.success(products);
  }
}
