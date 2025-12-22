import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/domain/use_case.dart';

import '../../entities/product.dart';
import '../../product_repository.dart';

class GetProductsByUserUsecase extends OldUseCase<String, List<Product>> {
  final ProductRepository _repository;

  GetProductsByUserUsecase({required ProductRepository repository})
      : _repository = repository;

  @override
  Future<EitherResult<List<Product>>> execute(String userId) async {
    final products = await _repository.getByUser(userId);
    return right(products);
  }
}
