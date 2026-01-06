import 'package:dartz/dartz.dart';
import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/services/media/interfaces/image_storage.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/products/domain/exceptions/add_product_failure.dart';
import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/domain/product_repository.dart';
import 'package:deehelp/features/products/domain/usecases/add/dtos/add_product_dto.dart';
import 'package:logging/logging.dart';

class AddProductUseCase extends UseCase<AddProductDto, Unit> {
  static final _logger = Logger("AddProductUseCase");
  final ProductRepository _repository;
  final ImageStorage _imageStorage;

  AddProductUseCase({
    required ProductRepository repository,
    required ImageStorage imageStorage,
  })  : _repository = repository,
        _imageStorage = imageStorage;

  @override
  Future<Result<Unit>> execute(AddProductDto dto) async {
    _logger.info("Iniciando AddProductUseCase para salvar o produto...");

    try {
      final newImagesMedia = await Future.wait(
        dto.images.map(
          (currentImageMedia) async {
            final newUrl = await _imageStorage.upload(currentImageMedia);
            return ImageMedia.fromWeb(
              url: newUrl,
              size: currentImageMedia.size,
              mimeType: currentImageMedia.mimeType,
              imageName: currentImageMedia.imageName,
            );
          },
        ),
      );

      final product = Product.fromDto(dto);
      product.changeImage(newImagesMedia);
      await _repository.save(product);
      _logger.info("Produto cadastrado com sucesso");
      return Result.success(unit);
    } catch (e) {
      await Future.wait(
        dto.images.map(
          (currentImageMedia) async {
            await _imageStorage.delete(currentImageMedia.imageName);
          },
        ),
      );
      return Result.failure(const AddProductFailure());
    }
  }
}
