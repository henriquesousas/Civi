import 'package:deehelp/core/env.dart';
import 'package:deehelp/core/services/media/interfaces/image_storage.dart';
import 'package:deehelp/core/services/media/services/r2_cloudflare_image_storage.dart';
import 'package:deehelp/features/auth/presentation/session/session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageStorageServiceProvider = Provider<ImageStorage>((ref) {
  final authenticatedUser = ref.watch(userSessionProvider);
  return R2CloudFlareImageStorage(
    bucketName: "deehelp",
    baseFolder: "products/${authenticatedUser!.id}",
    cdnUrl: Env.r2BaseUrl,
  );
});
