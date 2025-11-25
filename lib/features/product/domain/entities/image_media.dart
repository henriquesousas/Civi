import 'dart:io';

import 'package:deehelp/core/domain/valueobject/value_object.dart';

enum MediaSource { api, camera, gallery, assets }

//TODO: Validar values objetos
class ImageMedia extends ValueObject<String> {
  final File file;
  final MediaSource source;
  final Map<String, dynamic> metadata;

  ImageMedia({
    required this.file,
    required this.source,
    required this.metadata,
  }) : super(file.path);

  factory ImageMedia.fromGallery({
    required String url,
    required Map<String, dynamic> metadata,
  }) {
    return ImageMedia(
      file: File(url),
      source: MediaSource.gallery,
      metadata: metadata,
    );
  }

  factory ImageMedia.fromWeb({
    required String url,
    required Map<String, dynamic> metadata,
  }) {
    return ImageMedia(
      file: File(url),
      source: MediaSource.api,
      metadata: metadata,
    );
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
