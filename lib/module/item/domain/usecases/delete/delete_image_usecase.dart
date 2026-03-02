import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/services/storage/image_storage.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:deehelp/module/item/domain/exceptions/delete_image_failure.dart';
import 'package:deehelp/module/item/domain/product_repository.dart';
import 'package:deehelp/module/item/domain/usecases/delete/dtos/delete_image_dto.dart';
import 'package:logging/logging.dart';

class DeleteImageUsecase extends UseCase<DeleteImageDto, Unit> {
  static final _logger = Logger("DeleteImageUsecase");
  final ProductRepository _repository;
  final ImageStorage _imageStorage;

  DeleteImageUsecase({
    required ProductRepository repository,
    required ImageStorage imageStorage,
  })  : _repository = repository,
        _imageStorage = imageStorage;

  @override
  Future<Result<Unit>> execute(DeleteImageDto dto) async {
    try {
      _logger.info("Deletando imagem da base: ${dto.toString()}");
      await _repository.deleteImage(dto.image);
      _logger.info(
          "Imagem deletada da base com sucesso, agora vamos deletar da cloud: ${dto.image.imageName}");
      await _imageStorage.delete(dto.image.imageName);
      return Result.success(const Unit());
    } catch (e) {
      _logger.info("Erro ao deletar imagem: ${e.toString()}");
      return Result.failure(const DeleteImageFailure());
    }
  }
}
