// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;

// class ImageCompressionService {
//   // Configurações de qualidade
//   static const int maxWidth = 1200;
//   static const int maxHeight = 1200;
//   static const int quality = 85;
//   static const int thumbnailWidth = 400;
//   static const int thumbnailQuality = 70;

//   // Comprimir e redimensionar imagem
//   Future<File> compressAndResizeImage({
//     required File imageFile,
//     int maxWidth = maxWidth,
//     int maxHeight = maxHeight,
//     int quality = quality,
//   }) async {
//     try {
//       // Obter diretório temporário
//       final tempDir = await getTemporaryDirectory();
//       final targetPath =
//           '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

//       // Obter informações da imagem original
//       final originalSize = await imageFile.length();
//       print('Tamanho original: ${(originalSize / 1024).toStringAsFixed(2)} KB');

//       // Comprimir e redimensionar
//       final compressedFile = await FlutterImageCompress.compressAndGetFile(
//         imageFile.absolute.path,
//         targetPath,
//         minWidth: maxWidth,
//         minHeight: maxHeight,
//         quality: quality,
//         autoCorrectionAngle: true,
//         keepExif: false, // Remove metadados EXIF
//         format: CompressFormat.jpeg,
//       );

//       if (compressedFile == null) {
//         throw Exception('Falha ao comprimir imagem');
//       }

//       final compressedSize = await compressedFile.length();
//       final compressionRatio = ((1 - compressedSize / originalSize) * 100);

//       print(
//           'Tamanho comprimido: ${(compressedSize / 1024).toStringAsFixed(2)} KB');
//       print('Taxa de compressão: ${compressionRatio.toStringAsFixed(1)}%');

//       return compressedFile;
//     } catch (e) {
//       print('Erro na compressão: $e');
//       return imageFile; // Retorna original em caso de erro
//     }
//   }

//   // Gerar thumbnail
//   Future<File> generateThumbnail({
//     required File imageFile,
//     int width = thumbnailWidth,
//     int quality = thumbnailQuality,
//   }) async {
//     try {
//       final tempDir = await getTemporaryDirectory();
//       final thumbnailPath =
//           '${tempDir.path}/thumb_${DateTime.now().millisecondsSinceEpoch}.jpg';

//       final thumbnailFile = await FlutterImageCompress.compressAndGetFile(
//         imageFile.absolute.path,
//         thumbnailPath,
//         minWidth: width,
//         quality: quality,
//         format: CompressFormat.jpeg,
//       );

//       return thumbnailFile ?? imageFile;
//     } catch (e) {
//       print('Erro ao gerar thumbnail: $e');
//       return imageFile;
//     }
//   }

//   // Otimizar imagem mantendo proporção
//   Future<OptimizedImage> optimizeImage(File originalImage) async {
//     final compressedImage = await compressAndResizeImage(
//       imageFile: originalImage,
//       maxWidth: maxWidth,
//       maxHeight: maxHeight,
//       quality: quality,
//     );

//     final thumbnail = await generateThumbnail(
//       imageFile: compressedImage,
//       width: thumbnailWidth,
//       quality: thumbnailQuality,
//     );

//     return OptimizedImage(
//       original: originalImage,
//       compressed: compressedImage,
//       thumbnail: thumbnail,
//       originalSize: await originalImage.length(),
//       compressedSize: await compressedImage.length(),
//       thumbnailSize: await thumbnail.length(),
//     );
//   }
// }

// class OptimizedImage {
//   final File original;
//   final File compressed;
//   final File thumbnail;
//   final int originalSize;
//   final int compressedSize;
//   final int thumbnailSize;

//   OptimizedImage({
//     required this.original,
//     required this.compressed,
//     required this.thumbnail,
//     required this.originalSize,
//     required this.compressedSize,
//     required this.thumbnailSize,
//   });

//   double get compressionRatio => ((1 - compressedSize / originalSize) * 100);
//   double get savingsInKB => (originalSize - compressedSize) / 1024;
// }
