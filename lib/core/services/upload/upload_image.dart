import 'package:deehelp/core/services/upload/upload_info.dart';

//TODO: MediaStorage
abstract class MediaStorage {
  Future<void> upload(UploadInfo info);
}
