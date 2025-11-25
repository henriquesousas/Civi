import 'package:deehelp/core/services/media/media_storage_info.dart';

abstract class MediaStorage {
  Future<String> upload(MediaStorageInfo info);
  Future<void> delete(String imageName, String bucket);
}
