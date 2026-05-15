import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/module/item/domain/product_repository.dart';

class UpdateProductUseCase extends OLDUseCase<Product, Unit> {
  final ProductRepository _repository;

  UpdateProductUseCase({required ProductRepository repository})
      : _repository = repository;

  @override
  Future<Result<Unit>> execute(Product product) async {
    // final productResult = await _repository.getByCode(product.code);
    // if (productResult != null) {
    //   return Result.failure(
    //     ItemAlreadyExistException.from(
    //       EnumUtils.fromString(ItemType.values, product.type),
    //       product.code,
    //     ),
    //   );
    // }
    await _repository.update(product);
    return Result.success(const Unit());
  }
}
