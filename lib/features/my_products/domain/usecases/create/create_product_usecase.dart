import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/core/services/media/interfaces/media_storage.dart';
import 'package:logging/logging.dart';

import '../../../../../core/services/media/media_storage_info.dart';
import '../../entities/image_media.dart';
import '../../entities/product.dart';
import '../../product_exception.dart';
import '../../product_repository.dart';
import 'create_product_dto.dart';

class CreateProductUseCase extends UseCase<CreateProductDto, Unit> {
  static final _logger = Logger("CreateItemUsecase");
  final ProductRepository _repository;
  final MediaStorage _media;
  final String _bucket;
  final String _imageName;

  CreateProductUseCase({
    required ProductRepository repository,
    required MediaStorage media,
    required String bucket,
    required String imageName,
  })  : _repository = repository,
        _media = media,
        _imageName = imageName,
        _bucket = bucket;

  @override
  Future<EitherResult<Unit>> execute(CreateProductDto dto) async {
    try {
      final info = MediaStorageInfo.from(
        dto.image.file,
        _bucket,
        _imageName,
        ContentType.jpeg,
        "jpeg",
      );
      final item = Product.from(dto);
      final newUrl = await _media.upload(info);
      item.changeImage(ImageMedia.fromWeb(url: newUrl, metadata: const {}));
      await _repository.save(item);
      _logger.info("Produto cadastrado com sucesso");
      return right(unit);
    } catch (e) {
      await _media.delete(_imageName, _bucket);
      return left(ProductException(message: "R.strings.defaultMessageError"));
    }
  }
}
