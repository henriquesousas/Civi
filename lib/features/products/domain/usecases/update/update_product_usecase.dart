import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/domain/product_repository.dart';

class UpdateProductUseCase extends UseCase<Product, Unit> {
  final ProductRepository _repository;

  UpdateProductUseCase({required ProductRepository repository})
      : _repository = repository;

  @override
  Future<Result<Unit>> execute(Product product) async {
    await _repository.update(product);
    return Result.success(const Unit());
  }
}
