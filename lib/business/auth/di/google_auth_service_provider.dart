import 'package:deehelp/business/auth/external/google/google_auth_service_default.dart';
import 'package:deehelp/business/auth/external/google/google_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final googleAuthServiceProvider = Provider<GoogleAuthService>((ref) {
  return GoogleAuthServiceDefault();
});
