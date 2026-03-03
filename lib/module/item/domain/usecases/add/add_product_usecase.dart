import 'package:deehelp/core/utils/enum_utils.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/module/item/domain/exceptions/item_notfound_exception.dart';
import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/services/storage/image_storage.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/module/item/domain/exceptions/add_product_failure.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/module/item/domain/product_repository.dart';
import 'package:deehelp/module/item/domain/usecases/add/dtos/add_product_dto.dart';
import 'package:deehelp/core/utils/unit.dart';
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

    final item = await _repository.getByCode(dto.code);
    if (item != null) {
      final type = EnumUtils.fromString(ItemType.values, dto.type);
      return Result.failure(ItemNotFoundException.from(type, dto.code));
    }

    try {
      final newImagesMedia = await Future.wait(
        dto.images.map(
          (currentImageMedia) async {
            final newUrl = await _imageStorage.upload(currentImageMedia);
            _logger.info('Imagem upload com sucesso $newUrl');
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
      return Result.success(const Unit());
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
