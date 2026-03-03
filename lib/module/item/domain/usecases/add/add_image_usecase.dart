import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/services/storage/image_storage.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/module/item/domain/exceptions/upload_image_failure.dart';
import 'package:deehelp/module/item/domain/product_repository.dart';
import 'package:deehelp/module/item/domain/usecases/add/dtos/add_image_dto.dart';

class AddImageUsecase extends UseCase<AddImageDto, List<ImageMedia>> {
  final ProductRepository _repository;
  final ImageStorage _imageStorage;

  AddImageUsecase({
    required ImageStorage imageStorage,
    required ProductRepository repository,
  })  : _imageStorage = imageStorage,
        _repository = repository;

  @override
  Future<Result<List<ImageMedia>>> execute(AddImageDto dto) async {
    try {
      final newUrl = await _imageStorage.upload(dto.image);

      final newImageMedia = ImageMedia.fromWeb(
        url: newUrl,
        size: dto.image.size,
        mimeType: dto.image.mimeType,
        imageName: dto.image.imageName,
      );

      await _repository.saveImage(dto.product.id, newImageMedia);

      final currentImages = List<ImageMedia>.from(dto.product.images);
      currentImages.add(newImageMedia);

      return Result.success(currentImages);
    } catch (e) {
      await _imageStorage.delete(dto.image.imageName);
      return Result.failure(const UploadImageFailure());
    }
  }
}
