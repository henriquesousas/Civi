import '../../../../core/errors/failure.dart';

class GetCurrentUserFailure extends Failure {
  const GetCurrentUserFailure({String message = "Usuário não autenticado!"})
      : super(message);
}
