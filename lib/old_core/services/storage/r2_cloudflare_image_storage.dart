import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:deehelp/old_core/services/storage/image_storage.dart';
import 'package:deehelp/old_features/products/domain/entities/image_media.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class R2CloudFlareImageStorage implements ImageStorage {
  static final _logger = Logger("R2CloudFlareMediaStorage");
  static final statusCode = 200;

  final String bucketName;
  final String baseFolder;
  final String cdnUrl;

  R2CloudFlareImageStorage({
    required this.bucketName,
    required this.baseFolder,
    required this.cdnUrl,
  });

  @override
  Future<String> upload(ImageMedia image) async {
    final bytes = image.file.readAsBytesSync();
    final status = await CloudFlareR2.putObject(
      bucket: bucketName,
      objectName: "$baseFolder/${image.imageName}",
      objectBytes: bytes,
      contentType: image.mimeType,
    );

    if (status.status == statusCode) {
      _logger.info('Upload da imagem realizado com sucesso :$baseFolder');
      return "$cdnUrl/$baseFolder/${image.imageName}";
    }
    throw Exception(status.message);
  }

  @override
  Future<void> delete(String imageName) async {
    try {
      final name = "$baseFolder/$imageName";
      await CloudFlareR2.deleteObject(
        objectName: name,
        bucket: bucketName,
      );
    } catch (e) {
      debugPrint("Error Cloudflare: ${e.toString()}");
    }
  }
}
