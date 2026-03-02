import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/services/storage/image_storage.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/module/item/domain/exceptions/delete_product_failure.dart';
import 'package:deehelp/module/item/domain/product_repository.dart';
import 'package:logging/logging.dart';

class DeleteProductUsecase extends UseCase<Product, Unit> {
  static final _logger = Logger("DeleteProductUsecase");
  final ProductRepository _repository;
  final ImageStorage _imageStorage;

  DeleteProductUsecase({
    required ProductRepository repository,
    required ImageStorage imageStorage,
  })  : _repository = repository,
        _imageStorage = imageStorage;

  @override
  Future<Result<Unit>> execute(Product product) async {
    try {
      _logger.info("Deletando produto : ${product.toString()}");

      await Future.wait(
        product.images.map(
          (currentImageMedia) async {
            _logger.info("Deletando imagem: ${currentImageMedia.imageName}");
            await _imageStorage.delete(currentImageMedia.imageName);
          },
        ),
      );
      _logger.info("Todas as imagens foram apagadas");
      await _repository.delete(product.id);
      _logger.info("Produto deletado com sucesso");
      return Result.success(const Unit());
    } catch (e) {
      _logger.severe("Não foi possível apagar o produto: ${e.toString()}");
      return Result.failure(const DeleteProductFailure());
    }
  }
}
