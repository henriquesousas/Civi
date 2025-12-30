import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:deehelp/core/services/media/interfaces/media_storage.dart';
import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:logging/logging.dart';

class R2CloudFlareImageUpload implements ImageUpload {
  static final _logger = Logger("R2CloudFlareMediaStorage");
  static final statusCode = 200;

  final String bucketName;
  final String baseFolder;
  final String cdnUrl;

  R2CloudFlareImageUpload({
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
      return "$cdnUrl/$baseFolder";
    }
    throw Exception(status.message);
  }

  @override
  Future<void> delete(String imageName) async {
    final name = "$baseFolder/$imageName";
    await CloudFlareR2.deleteObject(
      objectName: name,
      bucket: bucketName,
    );
  }
}
