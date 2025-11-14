import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:deehelp/core/services/upload/upload_image.dart';
import 'package:deehelp/core/services/upload/upload_info.dart';
import 'package:firebase_storage/firebase_storage.dart';

class R2UploadImage implements MediaStorage {
  final FirebaseStorage storage;

  R2UploadImage({required this.storage});

  @override
  Future<void> upload(UploadInfo info) async {
    final bytes = info.file.readAsBytesSync();
    final name = "${info.objectName}.${info.extension}";
    await CloudFlareR2.putObject(
        bucket: info.bucket,
        objectName: name,
        objectBytes: bytes,
        contentType: info.contentType.value);
  }
}
