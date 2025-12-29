enum ContentType {
  jpeg('image/jpeg'),
  jpg('image/jpeg');

  const ContentType(this.value);
  final String value;

  @override
  String toString() => value;
}

//TODO: remover
// class MediaStorageInfo {
//   final File file;
//   final String bucket;
//   final String objectName;
//   final ContentType contentType;

//   MediaStorageInfo._({
//     required this.file,
//     required this.bucket,
//     required this.objectName,
//     required this.contentType,
//   });

//   factory MediaStorageInfo.fromJpeg(
//     File file,
//     String bucket,
//     String objectName,
//   ) {
//     return MediaStorageInfo._(
//       file: file,
//       bucket: bucket,
//       objectName: objectName,
//       contentType: ContentType.jpeg,
//     );
//   }
// }
