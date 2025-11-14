import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/core/services/upload/upload_image.dart';
import 'package:deehelp/core/services/upload/upload_info.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/domain/item_repository.dart';
import 'package:deehelp/features/itens/domain/usecases/upload/create_item_dto.dart';

class CreateItemUsecase extends UseCase<CreateItemDto, Unit> {
  final ItemRepository repository;
  final MediaStorage media;
  final String bucket;
  final String imageName;

  CreateItemUsecase({
    required this.media,
    required this.repository,
    required this.bucket,
    required this.imageName,
  });

  @override
  Future<EitherResult<Unit>> execute(CreateItemDto dto) async {
    try {
      // final bucket = "deehelp";
      // final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      // final String objectName = "products/"
      //     '$dto.userId/${DateTime.now().millisecondsSinceEpoch.toString()}';

      final info = UploadInfo.from(
        File(dto.imageUrl),
        bucket,
        imageName,
        ContentType.jpeg,
        FileExtension.jpeg,
      );
      await media.upload(info);

      final item = Item.from(dto);
      await repository.save(item);
      return right(unit);
    } catch (e) {
      //TODO: Delete image
      rethrow;
    }
  }
}
