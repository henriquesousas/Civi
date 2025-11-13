import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/features/itens/domain/upload_image_service.dart';

class UploadImageUsecase extends UseCase<String, Unit> {
  final UploadImageService uploadService;

  UploadImageUsecase({required this.uploadService});

  @override
  Future<EitherResult<Unit>> execute(String data) async {
    await uploadService.upload(File(data));

    return right(unit);
  }
}
