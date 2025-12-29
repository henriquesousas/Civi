import 'dart:io';

import 'package:deehelp/core/domain/valueobject/value_object.dart';

enum MediaSource { api, camera, gallery, assets }

class ImageMedia extends ValueObject<String> {
  final File file;
  final MediaSource source;
  final int size;
  final String mimeType;
  final String imageName;

  ImageMedia({
    required this.file,
    required this.source,
    required this.size,
    required this.mimeType,
    required this.imageName,
  }) : super(file.path);

  factory ImageMedia.fromGallery({
    required String url,
    required int size,
    required String mimeType,
    required String imageName,
  }) {
    return ImageMedia(
        file: File(url),
        source: MediaSource.gallery,
        size: size,
        mimeType: mimeType,
        imageName: imageName);
  }

  factory ImageMedia.fromWeb({
    required String url,
    required int size,
    required String mimeType,
    required String imageName,
  }) {
    return ImageMedia(
        file: File(url),
        source: MediaSource.api,
        size: size,
        mimeType: mimeType,
        imageName: imageName);
  }

  @override
  void validate(String value) {
    //TODO: Validar se a url é válida
  }

  String get fileExtension {
    final uri = Uri.tryParse(file.path);
    final path = uri?.path ?? file.path;
    return path.split('.').last.toLowerCase();
  }

  String get filePath {
    return file.path;
  }
}
