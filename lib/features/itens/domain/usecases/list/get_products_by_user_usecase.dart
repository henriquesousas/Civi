import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/domain/item_repository.dart';

class GetProductsByUserUsecase extends UseCase<String, List<Item>> {
  final ItemRepository _repository;

  GetProductsByUserUsecase({required ItemRepository repository})
      : _repository = repository;

  @override
  Future<EitherResult<List<Item>>> execute(String userId) async {
    final products = await _repository.getByUser(userId);
    return right(products);
  }
}
