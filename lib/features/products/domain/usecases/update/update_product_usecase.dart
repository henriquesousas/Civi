import 'package:dartz/dartz.dart';
import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/domain/product_repository.dart';

class UpdateProductUseCase extends UseCase<Product, Unit> {
  final ProductRepository _repository;

  UpdateProductUseCase({required ProductRepository repository})
      : _repository = repository;

  @override
  Future<Result<Unit>> execute(Product dto) async {
    await _repository.update(dto);
    return Result.success(unit);
  }
}
