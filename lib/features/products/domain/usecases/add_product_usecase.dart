import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/core/services/media/interfaces/media_storage.dart';
import 'package:deehelp/core/services/media/media_storage_info.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/products/domain/add_product_failure.dart';
import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/domain/product_repository.dart';
import 'package:deehelp/features/products/domain/usecases/dtos/add_product_dto.dart';
import 'package:logging/logging.dart';

class AddProductUseCase extends UseCase<AddProductDto, Unit> {
  static final _logger = Logger("AddProductUseCase");
  final ProductRepository _repository;
  final MediaStorage _media;
  final String _bucket;
  final String _imageName;

  AddProductUseCase({
    required ProductRepository repository,
    required MediaStorage media,
    required String bucket,
    required String imageName,
  })  : _repository = repository,
        _media = media,
        _imageName = imageName,
        _bucket = bucket;

  @override
  Future<Result<Unit>> execute(AddProductDto dto) async {
    _logger.info("Iniciando AddProductUseCase para salvar o produto...");
    try {
      final imageUrls = await Future.wait(
        dto.images.map(
          (currentFile) async {
            final mediaStorageInfo = MediaStorageInfo.fromJpeg(
              currentFile.file,
              _bucket,
              _imageName,
            );
            return await _media.upload(mediaStorageInfo);
          },
        ),
      );

      final product = Product.fromDto(dto);
      final images = imageUrls
          .map((newUrl) => ImageMedia.fromWeb(url: newUrl, metadata: const {}))
          .toList();
      product.changeImage(images);
      await _repository.save(product);
      _logger.info("Produto cadastrado com sucesso");
      return Result.success(unit);
    } catch (e) {
      await _media.delete(_imageName, _bucket);
      return Result.failure(const AddProductFailure());
    }
  }
}
