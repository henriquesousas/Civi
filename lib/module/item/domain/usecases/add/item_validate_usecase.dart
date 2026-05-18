import 'package:deehelp/old_core/utils/enum_utils.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/module/item/domain/exceptions/item_already_exist_exception.dart';
import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/module/item/domain/product_repository.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:logging/logging.dart';

class GetItemDto {
  final String code;
  final ItemType type;

  GetItemDto({required this.code, required this.type});
}

class ItemValidaUseCase extends OLDUseCase<GetItemDto, Unit> {
  static final _logger = Logger("ItemValidateUseCase");
  final ProductRepository _repository;

  ItemValidaUseCase({
    required ProductRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<Unit>> execute(GetItemDto dto) async {
    _logger.info("Iniciando validacao das informacoes do item...");
    final item = await _repository.getByCode(dto.code);
    if (item != null) {
      final type = EnumUtils.fromString(ItemType.values, dto.type.name);
      return Result.failure(ItemAlreadyExistException.from(type, dto.code));
    }

    return Result.success(const Unit());
  }
}
