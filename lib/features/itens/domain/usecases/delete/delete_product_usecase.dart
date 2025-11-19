import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/core/image_utils.dart';
import 'package:deehelp/core/services/upload/media_storage.dart';
import 'package:deehelp/features/itens/domain/item_exception.dart';
import 'package:deehelp/features/itens/domain/item_repository.dart';
import 'package:deehelp/features/itens/domain/usecases/delete/delete_product_dto.dart';
import 'package:logging/logging.dart';

import '../../../../../core/resources/resources.dart';

class DeleteProductUsecase extends UseCase<DeleteProductDto, Unit> {
  static final _logger = Logger("DeleteProductUsecase");
  final ItemRepository _repository;
  final MediaStorage _mediaStorage;
  final String _bucket;

  DeleteProductUsecase({
    required ItemRepository repository,
    required MediaStorage mediaStorage,
    required String bucket,
  })  : _repository = repository,
        _mediaStorage = mediaStorage,
        _bucket = bucket;

  @override
  Future<EitherResult<Unit>> execute(DeleteProductDto dto) async {
    final imageName = ImageUtils.extractImagePath(dto.imageUrl);
    if (imageName == null) {
      return left(ItemException.from(R.strings.userNotFound));
    }
    _logger.info("Deletando imagem : $imageName");
    _mediaStorage.delete(imageName, _bucket);
    _logger.info("Deletando produto : ${dto.toString()}");
    await _repository.delete(dto.itemId, dto.userId);
    _logger.info("Produto deletado com sucesso");
    return right(unit);
  }
}
