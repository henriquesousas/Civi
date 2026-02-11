import 'package:deehelp/old_features/auth/external/services/default_google_auth_service.dart';
import 'package:deehelp/old_features/auth/domain/services/google_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final googleAuthenticationProvider = Provider<GoogleAuthService>((ref) {
  return DefaultGoogleAuthService();
});
