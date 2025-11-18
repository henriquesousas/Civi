import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/features/itens/domain/item_repository.dart';

class DeleteProductUsecase extends UseCase<String, Unit> {
  final ItemRepository _repository;

  DeleteProductUsecase({required ItemRepository repository})
      : _repository = repository;

  @override
  Future<EitherResult<Unit>> execute(String userId) async {
    await _repository.delete(userId);
    return right(unit);
  }
}
