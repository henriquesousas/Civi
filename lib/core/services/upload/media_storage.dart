import 'package:deehelp/core/services/upload/upload_info.dart';

abstract class MediaStorage {
  Future<String> upload(UploadInfo info);
  Future<void> delete(String imageName, String bucket);
}
