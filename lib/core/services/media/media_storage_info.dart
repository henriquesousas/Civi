import 'dart:io';

enum ContentType {
  jpeg('image/jpeg'),
  jpg('image/jpeg');

  const ContentType(this.value);
  final String value;

  @override
  String toString() => value;
}

// enum FileExtension {
//   jpeg('jpeg'),
//   jpg('png');
//
//   const FileExtension(this.value);
//   final String value;
//
//   @override
//   String toString() => value;
// }

class MediaStorageInfo {
  final File file;
  final String bucket;
  final String objectName;
  final ContentType contentType;
  final String extension;

  MediaStorageInfo._({
    required this.file,
    required this.bucket,
    required this.objectName,
    required this.contentType,
    required this.extension,
  });

  factory MediaStorageInfo.fromJpeg(
      File file, String bucket, String objectName) {
    return MediaStorageInfo._(
      file: file,
      bucket: bucket,
      objectName: objectName,
      contentType: ContentType.jpeg,
      extension: "jpeg",
    );
  }
}
