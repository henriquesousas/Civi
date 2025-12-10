import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/core/image_utils.dart';
import 'package:deehelp/core/services/media/interfaces/media_storage.dart';
import 'package:logging/logging.dart';

import '../../../../../core/ui/assets/resources.dart';
import '../../product_exception.dart';
import '../../product_repository.dart';
import 'delete_product_dto.dart';

class DeleteProductUsecase extends UseCase<DeleteProductDto, Unit> {
  static final _logger = Logger("DeleteProductUsecase");
  final ProductRepository _repository;
  final MediaStorage _mediaStorage;
  final String _bucket;

  DeleteProductUsecase({
    required ProductRepository repository,
    required MediaStorage mediaStorage,
    required String bucket,
  })  : _repository = repository,
        _mediaStorage = mediaStorage,
        _bucket = bucket;

  @override
  Future<EitherResult<Unit>> execute(DeleteProductDto dto) async {
    final imageName = ImageUtils.extractImagePath(dto.imageUrl);
    if (imageName == null) {
      return left(ProductException.from("R.strings.userNotFound"));
    }
    _logger.info("Deletando imagem : $imageName");
    _mediaStorage.delete(imageName, _bucket);
    _logger.info("Deletando produto : ${dto.toString()}");
    await _repository.delete(dto.itemId, dto.userId);
    _logger.info("Produto deletado com sucesso");
    return right(unit);
  }
}
