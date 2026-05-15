import 'package:deehelp/business/_shared/failures/failure.dart';

final class NetworkFailure extends Failure {
  const NetworkFailure()
      : super('Sem conexão com a internet. Verifique sua rede.');
}
