import 'package:deehelp/core/failures/exports.dart';
import 'package:deehelp/business/auth/loggued_user.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  TaskEither<Failure, LogguedUser> signInWithGoogle(
    String idToken,
    String accessToken,
  );
}
