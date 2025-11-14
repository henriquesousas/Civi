import 'dart:io';

enum ContentType {
  jpeg('image/jpeg'),
  jpg('image/jpeg');

  const ContentType(this.value);
  final String value;

  @override
  String toString() => value;
}

enum FileExtension {
  jpeg('jpeg'),
  jpg('png');

  const FileExtension(this.value);
  final String value;

  @override
  String toString() => value;
}

class UploadInfo {
  final File file;
  final String bucket;
  final String objectName;
  final ContentType contentType;
  final FileExtension extension;

  UploadInfo._({
    required this.file,
    required this.bucket,
    required this.objectName,
    required this.contentType,
    required this.extension,
  });

  factory UploadInfo.from(
    File file,
    String bucket,
    String objectName,
    ContentType type,
    FileExtension extension,
  ) {
    return UploadInfo._(
      file: file,
      bucket: bucket,
      objectName: objectName,
      contentType: type,
      extension: extension,
    );
  }
}
