import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/old_features/auth/domain/services/google_credentials.dart';

abstract class GoogleAuthService {
  Future<Result<GoogleCredentials>> auth();
}
