import 'dart:io';

abstract class UploadImageService {
  Future<void> upload(File file);
}
