import 'package:deehelp/core/failures/exports.dart';
import 'package:deehelp/core/data/auth/google/google_credentials.dart';
import 'package:fpdart/fpdart.dart';

abstract class GoogleAuthService {
  TaskEither<Failure, GoogleCredentials> auth();
}
