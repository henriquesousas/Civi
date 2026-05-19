import 'package:deehelp/infra/auth/services/google_auth_service_default.dart';
import 'package:deehelp/business/auth/services/google_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final googleAuthServiceProvider = Provider<GoogleAuthService>((ref) {
  return GoogleAuthServiceDefault();
});
