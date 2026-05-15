import 'package:deehelp/business/_shared/failures/failure.dart';
import 'package:deehelp/business/_shared/failures/unexpected_failure.dart';
import 'package:deehelp/business/auth/domain/auth_datasource.dart';
import 'package:deehelp/business/auth/domain/logged_user.dart';
import 'package:deehelp/business/auth/domain/auth_repository.dart';
import 'package:deehelp/business/auth/domain/auth_exception.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logging/logging.dart';

class AuthRepositoryRemote implements AuthRepository {
  static final _logger = Logger("AuthRepositoryRemote");
  final AuthDataSource _datasource;

  AuthRepositoryRemote({
    required AuthDataSource datasource,
  }) : _datasource = datasource;

  @override
  TaskEither<Failure, LoggedUser> signInWithGoogle(
    String idToken,
    String accessToken,
  ) {
    _logger.info("AuthRepositoryRemote: Iniciando signInWithGoogle");
    return TaskEither.tryCatch(
      () => _datasource.signInWithGoogle(idToken, accessToken),
      (error, stackTrace) => _mapException(error, stackTrace),
    );
  }

  Failure _mapException(Object error, StackTrace _) {
    if (error is AuthException) return error.failure;
    return const UnexpectedFailure();
  }
}
