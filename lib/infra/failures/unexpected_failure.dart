import 'package:deehelp/infra/failures/failure.dart';

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'Ocorreu um erro inesperado.']);
}
