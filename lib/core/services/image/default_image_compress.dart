import 'package:deehelp/core/services/image/image_compress.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class DefaultImageCompress implements ImageCompress {
  final int minWidth;
  final int minHeight;
  final int quality;

  DefaultImageCompress({
    this.minWidth = 1080,
    this.minHeight = 1080,
    this.quality = 75,
  });

  @override
  Future<XFile> compress(XFile file, String outputName) async {
    try {
      final compressedFile = await FlutterImageCompress.compressAndGetFile(
        file.path,
        "${file.path}_compressed_$outputName",
        minWidth: minWidth,
        minHeight: minHeight,
        quality: quality,
      );

      return compressedFile ?? file;
    } catch (ex) {
      return file;
    }
  }
}
