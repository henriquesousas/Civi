import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class ImageUtils {
  static String? getMimetype(XFile file) {
    final path = file.path;
    String? mimeType;
    if (path.endsWith(".jpg") || path.endsWith(".jpeg")) {
      mimeType = "image/jpeg";
    } else if (path.endsWith(".png")) {
      mimeType = "image/png";
    } else if (path.endsWith(".webp")) {
      mimeType = "image/webp";
    }
    return mimeType;
  }

  static getExtension(XFile file) {
    return path.extension(file.path);
  }
}
