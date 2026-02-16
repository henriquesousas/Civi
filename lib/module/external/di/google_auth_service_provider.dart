import 'package:deehelp/module/external/services/default_google_auth_service.dart';
import 'package:deehelp/module/auth/domain/services/google_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final googleAuthenticationProvider = Provider<GoogleAuthService>((ref) {
  return DefaultGoogleAuthService();
});
