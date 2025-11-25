import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/domain/use_case.dart';

import '../../entities/product.dart';
import '../../product_repository.dart';

class UpdateProductUseCase extends UseCase<Product, Unit> {
  final ProductRepository _repository;

  UpdateProductUseCase({required ProductRepository repository})
      : _repository = repository;

  @override
  Future<EitherResult<Unit>> execute(Product dto) async {
    await _repository.update(dto);
    return right(unit);
  }
}
