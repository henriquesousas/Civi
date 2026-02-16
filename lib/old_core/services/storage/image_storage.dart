import 'package:deehelp/module/item/domain/entities/image_media.dart';

abstract class ImageStorage {
  Future<String> upload(ImageMedia image);
  Future<void> delete(String imageName);
}
