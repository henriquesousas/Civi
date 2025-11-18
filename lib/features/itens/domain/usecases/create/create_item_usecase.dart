import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/core/services/upload/media_storage.dart';
import 'package:deehelp/core/services/upload/upload_info.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/domain/item_exception.dart';
import 'package:deehelp/features/itens/domain/item_repository.dart';
import 'package:deehelp/features/itens/domain/usecases/upload/create_item_dto.dart';
import 'package:logging/logging.dart';

import '../../../../../core/resources/resources.dart';

class CreateItemUsecase extends UseCase<CreateItemDto, Unit> {
  static final _logger = Logger("CreateItemUsecase");
  final ItemRepository _repository;
  final MediaStorage _media;
  final String _bucket;
  final String _imageName;

  CreateItemUsecase({
    required ItemRepository repository,
    required MediaStorage media,
    required String bucket,
    required String imageName,
  })  : _repository = repository,
        _media = media,
        _imageName = imageName,
        _bucket = bucket;

  @override
  Future<EitherResult<Unit>> execute(CreateItemDto dto) async {
    try {
      final info = UploadInfo.from(
        File(dto.imageUrl),
        _bucket,
        _imageName,
        ContentType.jpeg,
        FileExtension.jpeg,
      );
      final newUrl = await _media.upload(info);
      final item = Item.from(dto);
      item.changeUrl(newUrl);
      await _repository.save(item);
      _logger.info("Produto cadastrado com sucesso");
      return right(unit);
    } catch (e) {
      await _media.delete(_imageName, _bucket);
      throw ItemException(
        message: R.strings.defaultMessageError,
      );
    }
  }
}
