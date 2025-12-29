import 'package:deehelp/features/products/domain/entities/image_media.dart';

abstract class ImageUpload {
  Future<String> upload(ImageMedia image);
  Future<void> delete(String imageName, String bucket);
}
