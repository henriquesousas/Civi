import 'package:deehelp/business/_shared/failures/exports.dart';
import 'package:deehelp/business/auth/domain/loggued_user.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  TaskEither<Failure, LogguedUser> signInWithGoogle(
    String idToken,
    String accessToken,
  );
  // Future<Result<LoggedUser>> signInWithCredentials(
  //   String idToken,
  //   String accessToken,
  // );
  // Future<Result<Unit>> signOut();
  // Future<Result<LoggedUser>> getCurrentUser();
}
