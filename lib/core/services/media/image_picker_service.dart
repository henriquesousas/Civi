import 'package:image_picker/image_picker.dart';

import '../../../features/products/domain/entities/image_media.dart';

//TODO: Injetar ImagePicker
class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<ImageMedia?> pickImageFromGallery() async {
    try {
      final XFile? imageFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (imageFile == null) return null;

      return ImageMedia.fromGallery(
        url: imageFile.path,
        metadata: {
          'name': imageFile.name,
          'size': await imageFile.length(),
          'mime_type': imageFile.mimeType,
        },
      );
    } catch (e) {
      return null;
    }
  }
}
