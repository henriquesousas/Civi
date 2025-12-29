import 'package:flutter_image_compress/flutter_image_compress.dart';

abstract class ImageCompress {
  Future<XFile> compress(XFile file, String outputName);
}
