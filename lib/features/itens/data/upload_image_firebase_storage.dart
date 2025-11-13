import 'dart:io';

import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:deehelp/core/env.dart';
import 'package:deehelp/features/itens/domain/upload_image_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadImageFirebaseStorage implements UploadImageService {
  final FirebaseStorage storage;

  UploadImageFirebaseStorage({required this.storage});

  @override
  Future<void> upload(File file) async {
    try {
      CloudFlareR2.init(
        accountId: Env.clAccountId,
        accessKeyId: Env.clAccessKeyId,
        secretAccessKey: Env.clSecretAccessKeyId,
      );
      const String userId = '12345678';
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      const String fileExtension = 'jpeg';
      final String objectName = "products/" '$userId/$timestamp.$fileExtension';
      final bytes = file.readAsBytesSync();
      final status = await CloudFlareR2.putObject(
          bucket: 'deehelp',
          objectName: objectName,
          objectBytes: bytes,
          contentType: 'image/jpeg');
      print(status);
    } catch (e) {
      print(e.toString());
    }
  }
}
