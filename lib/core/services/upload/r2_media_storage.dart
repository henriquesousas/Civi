import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:deehelp/core/env.dart';
import 'package:deehelp/core/services/upload/media_storage.dart';
import 'package:deehelp/core/services/upload/upload_info.dart';
import 'package:logging/logging.dart';

class R2MediaStorage implements MediaStorage {
  static final _logger = Logger("R2MediaStorage");
  static final statusCode = 200;
  @override
  Future<String> upload(UploadInfo info) async {
    final bytes = info.file.readAsBytesSync();
    final status = await CloudFlareR2.putObject(
        bucket: info.bucket,
        objectName: info.objectName,
        objectBytes: bytes,
        contentType: info.contentType.value);

    if (status.status == statusCode) {
      _logger
          .info('Upload da imagem realizado com sucesso :${info.objectName}');
      return "${Env.r2BaseUrl}/${info.objectName}";
    }
    throw Exception(status.message);
  }

  @override
  Future<void> delete(String imageName, String bucket) async {
    await CloudFlareR2.deleteObject(
      objectName: imageName,
      bucket: bucket,
    );
  }
}
