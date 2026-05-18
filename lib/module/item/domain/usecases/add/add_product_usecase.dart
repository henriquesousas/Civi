import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:deehelp/old_core/env_config.dart';
import 'package:deehelp/old_core/utils/enum_utils.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/module/item/domain/exceptions/item_notfound_exception.dart';
import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/old_core/services/storage/image_storage.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/module/item/domain/exceptions/add_product_failure.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/module/item/domain/product_repository.dart';
import 'package:deehelp/module/item/domain/usecases/add/dtos/add_product_dto.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:logging/logging.dart';

class AddProductUseCase extends OLDUseCase<AddProductDto, Unit> {
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
    List<ImageMedia> medias = [];

    final item = await _repository.getByCode(dto.code);
    if (item != null) {
      final type = EnumUtils.fromString(ItemType.values, dto.type);
      return Result.failure(ItemNotFoundException.from(type, dto.code));
    }

    try {
      if (dto.images.isNotEmpty) {
        await CloudFlareR2.init(
          accountId: EnvConfig.r2AccountId,
          accessKeyId: EnvConfig.r2AccessKeyId,
          secretAccessKey: EnvConfig.r2SecretAccessKeyId,
        );

        medias = await Future.wait(
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
      }

      final product = Product.fromDto(dto);
      product.changeImage(medias);
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
