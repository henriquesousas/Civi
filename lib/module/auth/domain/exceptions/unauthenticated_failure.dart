import '../../../../core/errors/failure.dart';

class UnauthenticatedFailure extends Failure {
  const UnauthenticatedFailure({String message = "Usuário não autenticado!"})
      : super(message);
}
