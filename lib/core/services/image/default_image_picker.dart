import 'package:deehelp/core/services/image/image_picker_failure.dart';
import 'package:deehelp/core/utils/image_utils.dart';
import 'package:deehelp/core/services/image/image_compress.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:image_picker/image_picker.dart';

class DefaultImagePicker {
  final ImageCompress _imageCompress;
  final ImagePicker _picker = ImagePicker();

  DefaultImagePicker({required ImageCompress imageCompress})
      : _imageCompress = imageCompress;

  Future<Result<ImageMedia>> pickImageFromGallery() async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      if (file == null) return Result.failure(const ImagePickerFailure());

      String? mimeType = ImageUtils.getMimetype(file);

      if (mimeType == null) {
        return Result.failure(
          const ImagePickerFailure(message: "Arquivo não suportado"),
        );
      }

      final ext = ImageUtils.getExtension(file);
      final imageOutputName =
          "${DateTime.now().millisecondsSinceEpoch.toString()}$ext";

      final compressedImage =
          await _imageCompress.compress(file, imageOutputName);
      final size = await compressedImage.length();
      final imageMeda = ImageMedia.fromGallery(
        url: compressedImage.path,
        size: size,
        mimeType: mimeType,
        imageName: imageOutputName,
      );
      return Result.success(imageMeda);
    } catch (e) {
      return Result.failure(const ImagePickerFailure());
    }
  }
}
