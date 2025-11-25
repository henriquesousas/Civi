import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:deehelp/core/env.dart';
import 'package:deehelp/core/services/media/interfaces/media_storage.dart';
import 'package:logging/logging.dart';

import 'media_storage_info.dart';

class R2CloudFlareMediaStorage implements MediaStorage {
  static final _logger = Logger("R2MediaStorage");
  static final statusCode = 200;
  @override
  Future<String> upload(MediaStorageInfo info) async {
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
