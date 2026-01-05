import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/services/media/interfaces/media_storage.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/products/domain/exceptions/delete_image_failure.dart';
import 'package:deehelp/features/products/domain/product_repository.dart';
import 'package:deehelp/features/products/domain/usecases/delete/dtos/delete_image_dto.dart';

class DeleteImageUsecase extends UseCase<DeleteImageDto, Unit> {
  final ProductRepository _repository;
  final ImageUpload _imageUpload;

  DeleteImageUsecase({
    required ProductRepository repository,
    required ImageUpload imageUpload,
  })  : _repository = repository,
        _imageUpload = imageUpload;

  @override
  Future<Result<Unit>> execute(DeleteImageDto dto) async {
    try {
      await _repository.deleteImage(dto.image);
      await _imageUpload.delete(dto.image.imageName);
      return Result.success(const Unit());
    } catch (e) {
      return Result.failure(const DeleteImageFailure());
    }
  }
}
