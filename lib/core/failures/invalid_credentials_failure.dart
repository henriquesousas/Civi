import 'package:deehelp/core/failures/exports.dart';

final class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure()
      : super('E-mail ou senha inválidos. Tente novamente.');
}
