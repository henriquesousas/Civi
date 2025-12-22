import 'package:deehelp/features/auth/domain/services/google_credentials.dart';
import 'package:deehelp/core/utils/result.dart';

abstract class GoogleAuthService {
  Future<Result<GoogleCredentials>> auth();
}
