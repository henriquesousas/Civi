import 'package:deehelp/business/_shared/failures/exports.dart';
import 'package:deehelp/business/auth/external/google/google_credentials.dart';
import 'package:fpdart/fpdart.dart';

abstract class GoogleAuthService {
  TaskEither<Failure, GoogleCredentials> auth();
}
