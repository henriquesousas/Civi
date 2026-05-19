import 'package:deehelp/infra/failures/failure.dart';
import 'package:deehelp/business/auth/auth_datasource.dart';
import 'package:deehelp/business/auth/loggued_user.dart';
import 'package:deehelp/business/auth/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logging/logging.dart';

class AuthRepositoryRemote implements AuthRepository {
  static final _logger = Logger("AuthRepositoryRemote");
  final AuthDataSource _datasource;

  AuthRepositoryRemote({
    required AuthDataSource datasource,
  }) : _datasource = datasource;

  @override
  TaskEither<Failure, LogguedUser> signInWithGoogle(
    String idToken,
    String accessToken,
  ) {
    _logger.info("AuthRepositoryRemote: Iniciando signInWithGoogle");
    return TaskEither.tryCatch(
      () => _datasource.signInWithGoogle(idToken, accessToken),
      (error, stackTrace) => error as Failure,
    );
  }
}
