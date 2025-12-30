import '../../domain/entities/image_media.dart';

class ImageMediaModel {
  static ImageMedia fromMap(Map<String, dynamic> map) {
    return ImageMedia.fromWeb(
      url: map["url"],
      size: map["size"],
      mimeType: map["mime_type"],
      imageName: 'image_name',
    );
  }

  static List<Map<String, dynamic>> toMap(List<ImageMedia> images) {
    return images
        .map(
          (e) => {
            "url": e.fullPath,
            "size": e.size,
            "mime_type": e.mimeType,
          },
        )
        .toList();
  }
}
