import 'package:deehelp/core/env_config.dart';
import 'package:deehelp/core/services/storage/image_storage.dart';
import 'package:deehelp/core/services/storage/r2_cloudflare_image_storage.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//TODO: Acoplado a esse prover authenticatedUserProvider
final imageStorageServiceProvider = Provider<ImageStorage>((ref) {
  final authenticatedUser = ref.watch(authenticatedUserProvider);
  if (authenticatedUser == null) {
    throw Exception("User must be authenticated to access image storage.");
  }
  return R2CloudFlareImageStorage(
    bucketName: "deehelp",
    baseFolder: "products/${authenticatedUser.id}",
    cdnUrl: EnvConfig.r2BaseUrl,
  );
});
