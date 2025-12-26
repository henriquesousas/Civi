import '../../domain/entities/image_media.dart';

class ImageMediaModel {
  static ImageMedia fromMap(Map<String, dynamic> map) {
    return ImageMedia.fromWeb(url: map["url_image"], metadata: const {});
  }
}
