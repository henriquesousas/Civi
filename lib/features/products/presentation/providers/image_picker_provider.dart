import 'package:deehelp/core/services/media/default_image_compress.dart';
import 'package:deehelp/core/services/media/default_image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageCompressProvider = Provider<DefaultImageCompress>((ref) {
  return DefaultImageCompress();
});

final imagePickerProvider = Provider<DefaultImagePicker>((ref) {
  final defaultImageCompress = ref.watch(imageCompressProvider);
  return DefaultImagePicker(imageCompress: defaultImageCompress);
});
