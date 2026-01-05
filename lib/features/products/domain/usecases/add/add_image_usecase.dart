import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/services/media/interfaces/media_storage.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:deehelp/features/products/domain/exceptions/upload_image_failure.dart';
import 'package:deehelp/features/products/domain/product_repository.dart';
import 'package:deehelp/features/products/domain/usecases/add/dtos/add_image_dto.dart';

class AddImageUsecase extends UseCase<AddImageDto, List<ImageMedia>> {
  final ProductRepository _repository;
  final ImageUpload _imageUpload;

  AddImageUsecase({
    required ImageUpload imageUpload,
    required ProductRepository repository,
  })  : _imageUpload = imageUpload,
        _repository = repository;

  @override
  Future<Result<List<ImageMedia>>> execute(AddImageDto dto) async {
    try {
      final newUrl = await _imageUpload.upload(dto.image);
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
      await _imageUpload.delete(dto.image.imageName);
      return Result.failure(const UploadImageFailure());
    }
  }
}
