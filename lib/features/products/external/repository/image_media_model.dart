import '../../domain/entities/image_media.dart';

class ImageMediaModel {
  static ImageMedia fromMap(Map<String, dynamic> map) {
    return ImageMedia.fromWeb(
      url: map["url"],
      size: map["size"],
      mimeType: map["mime_type"],
      imageName: map["image_name"],
    );
  }

  static List<Map<String, dynamic>> toListMap(List<ImageMedia> images) {
    return images.map((e) => toMap(e)).toList();
  }

  static Map<String, dynamic> toMap(ImageMedia image) {
    return {
      "url": image.path,
      "size": image.size,
      "mime_type": image.mimeType,
      "image_name": image.imageName
    };
  }
}
