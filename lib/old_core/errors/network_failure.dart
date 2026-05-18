import 'package:deehelp/old_core/errors/failure.dart';

class NetworkFailure extends Failure {
  const NetworkFailure() : super('Sem conexão com a internet');
}
