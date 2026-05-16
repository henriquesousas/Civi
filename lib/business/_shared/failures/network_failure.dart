import 'package:deehelp/business/_shared/failures/failure.dart';
import 'package:deehelp/business/_shared/failures/type_failure.dart';

final class NetworkFailure extends Failure {
  const NetworkFailure()
      : super('Sem conexão com a internet. Verifique sua rede.',
            type: TypeFailure.network);
}
