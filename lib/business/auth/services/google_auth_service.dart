import 'package:deehelp/infra/failures/exports.dart';
import 'package:deehelp/business/auth/services/google_credentials.dart';
import 'package:fpdart/fpdart.dart';

abstract class GoogleAuthService {
  TaskEither<Failure, GoogleCredentials> auth();
}
