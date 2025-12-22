import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/auth/domain/services/google_credentials.dart';

abstract class GoogleAuthService {
  Future<Result<GoogleCredentials>> auth();
}
